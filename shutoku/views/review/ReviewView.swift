import SwiftUI

struct ReviewView: View {
    let deck: Deck
    let onReturnHome: () -> Void

    @State private var cards: [ReviewCard] = []
    @State private var reviewStates: [String: ReviewState] = [:]
    @State private var currentIndex = 0
    @State private var sessionComplete = false
    @State private var newCardsRemaining: Int = 0
    @State private var reviewCardsRemaining: Int = 0

    private var todayKey: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }

    private var sessionCardIDsKey: String { "sessionCardIDs_\(deck.id)_\(todayKey)" }
    private var sessionIndexKey: String { "sessionIndex_\(deck.id)_\(todayKey)" }
    private var shownTodayKey: String { "shownToday_\(deck.id)_\(todayKey)" }

    private var shownToday: Set<String> {
        Set(UserDefaults.standard.stringArray(forKey: shownTodayKey) ?? [])
    }

    var body: some View {
        VStack {
            if cards.isEmpty {
                ContentUnavailableView(
                    "All done for now",
                    systemImage: "checkmark.circle",
                    description: Text("No cards due. Come back later or adjust your daily limit in Settings.")
                )
            } else {
                VStack(spacing: 0) {
                    HStack(spacing: 16) {
                        Label("\(newCardsRemaining)", systemImage: "sparkle")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                        Label("\(reviewCardsRemaining)", systemImage: "arrow.clockwise")
                            .font(.subheadline)
                            .foregroundColor(.orange)
                        Spacer()
                        Text("\(min(currentIndex + 1, cards.count)) / \(cards.count)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))

                    CardView(
                        card: currentCard,
                        onGradeSelected: handleGrade
                    )
                }
            }
        }
        .navigationTitle(deck.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $sessionComplete) {
            SessionCompleteView {
                onReturnHome()
            }
        }
        .onAppear {
            loadSession()
        }
    }

    private var currentCard: ReviewCard {
        cards[currentIndex]
    }

    private func updateCounters() {
        guard currentIndex < cards.count else { return }
        let remaining = Array(cards[currentIndex...])
        newCardsRemaining = remaining.filter {
            !(reviewStates[$0.id]?.hasBeenReviewed ?? false)
        }.count
        reviewCardsRemaining = remaining.filter {
            reviewStates[$0.id]?.hasBeenReviewed ?? false
        }.count
    }

    private func loadSession() {
        let allStates = StorageManager.loadReviewStates()
        reviewStates = Dictionary(uniqueKeysWithValues: allStates.map { ($0.cardID, $0) })

        if let savedCardIDs = UserDefaults.standard.stringArray(forKey: sessionCardIDsKey),
           !savedCardIDs.isEmpty {
            let savedIndex = UserDefaults.standard.integer(forKey: sessionIndexKey)
            let entries = DataLoader.loadEntries(from: deck)
            let entryMap = Dictionary(uniqueKeysWithValues: entries.map { ($0.id.uuidString, $0) })

            var restored: [ReviewCard] = []
            for cardID in savedCardIDs {
                let parts = cardID.components(separatedBy: "-")
                guard parts.count >= 6 else { continue }
                let uuidString = parts.dropLast().joined(separator: "-")
                let directionString = parts.last ?? ""
                let direction: CardDirection = directionString == "japaneseToEnglish" ? .japaneseToEnglish : .englishToJapanese

                if let entry = entryMap[uuidString],
                   let state = reviewStates[cardID] {
                    restored.append(ReviewCard(
                        id: cardID,
                        entry: entry,
                        direction: direction,
                        reviewState: state
                    ))
                }
            }

            if !restored.isEmpty {
                cards = restored
                currentIndex = min(savedIndex, cards.count - 1)
                updateCounters()
                return
            }
        }

        buildNewSession()
    }

    private func buildNewSession() {
        let entries = DataLoader.loadEntries(from: deck)
        let newLimit = DailyLimitManager.limit(for: deck.id)
        let alreadyShownToday = shownToday
        let now = Date()

        var reviewCards: [ReviewCard] = []
        var newCards: [ReviewCard] = []

        for entry in entries {
            let pairs: [(String, CardDirection)] = [
                ("\(entry.id.uuidString)-japaneseToEnglish", .japaneseToEnglish),
                ("\(entry.id.uuidString)-englishToJapanese", .englishToJapanese)
            ]

            for (cardID, direction) in pairs {
                if let state = reviewStates[cardID] {
                    if state.hasBeenReviewed && state.dueDate <= now {
                        reviewCards.append(ReviewCard(
                            id: state.cardID,
                            entry: entry,
                            direction: direction,
                            reviewState: state
                        ))
                    } else if !state.hasBeenReviewed && !alreadyShownToday.contains(cardID) {
                        newCards.append(ReviewCard(
                            id: state.cardID,
                            entry: entry,
                            direction: direction,
                            reviewState: state
                        ))
                    }
                }
            }
        }

        let cappedNewCards = Array(newCards.prefix(newLimit))
        let newIDs = cappedNewCards.map { $0.id }
        let updatedShown = Array(alreadyShownToday.union(newIDs))
        UserDefaults.standard.set(updatedShown, forKey: shownTodayKey)

        // Separate by direction — all J→E first, then all E→J
        let reviewJtoE = reviewCards.filter { $0.direction == .japaneseToEnglish }.shuffled()
        let reviewEtoJ = reviewCards.filter { $0.direction == .englishToJapanese }.shuffled()
        let newJtoE = cappedNewCards.filter { $0.direction == .japaneseToEnglish }
        let newEtoJ = cappedNewCards.filter { $0.direction == .englishToJapanese }

        cards = reviewJtoE + newJtoE + reviewEtoJ + newEtoJ
        currentIndex = 0
        saveSessionState()
        updateCounters()
    }

    private func saveSessionState() {
        UserDefaults.standard.set(cards.map { $0.id }, forKey: sessionCardIDsKey)
        UserDefaults.standard.set(currentIndex, forKey: sessionIndexKey)
    }

    private func handleGrade(_ grade: ReviewGrade) {
        let currentCardCopy = currentCard
        guard let state = reviewStates[currentCardCopy.id] else { return }

        let updatedState = ReviewScheduler.updateReviewState(state, grade: grade)
        reviewStates[updatedState.cardID] = updatedState
        StorageManager.saveReviewStates(Array(reviewStates.values))

        if updatedState.isLearning && grade.rawValue < 4 {
            cards.append(ReviewCard(
                id: currentCardCopy.id,
                entry: currentCardCopy.entry,
                direction: currentCardCopy.direction,
                reviewState: updatedState
            ))
        }

        
        if currentIndex < cards.count - 1 {
            currentIndex += 1
            saveSessionState()
            updateCounters()
        } else {
            saveSessionState()
            StreakManager.markCompleted(deckID: deck.id)
            sessionComplete = true
        }
    }
}
