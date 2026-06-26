import SwiftUI

enum KanaDirection: String {
    case kanaToRomaji = "kanaToRomaji"
    case romajiToKana = "romajiToKana"
}

struct KanaReviewCard: Identifiable {
    let id: String
    let entry: KanaEntry
    let direction: KanaDirection
}

struct KanaReviewView: View {
    let script: KanaScript
    let entries: [KanaEntry]

    @State private var cards: [KanaReviewCard] = []
    @State private var reviewStates: [String: ReviewState] = [:]
    @State private var currentIndex = 0
    @State private var sessionComplete = false
    @State private var isFlipped = false

    var body: some View {
        VStack {
            if cards.isEmpty {
                Text("No cards due for review")
                    .foregroundColor(.secondary)
            } else {
                VStack(spacing: 24) {
                    ProgressView(
                        value: Double(currentIndex),
                        total: Double(cards.count)
                    )
                    .padding(.horizontal)

                    KanaCardView(
                        card: cards[currentIndex],
                        script: script,
                        isFlipped: isFlipped
                    )
                    .onTapGesture { isFlipped = true }

                    if isFlipped {
                        let intervals = ReviewScheduler.previewIntervals(for: reviewStates[cards[currentIndex].id]!)
                        ReviewButtons(
                            againText: intervals.again,
                            difficultText: intervals.difficult,
                            okayText: intervals.okay,
                            goodText: intervals.good,
                            easyText: intervals.easy,
                            onGradeSelected: handleGrade
                        )
                        .padding(.horizontal)
                    } else {
                        Text("Tap card to reveal")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .navigationTitle(script.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $sessionComplete) {
            SessionCompleteView { }
        }
        .onAppear { loadCards() }
    }

    private func loadCards() {
        let allStates = StorageManager.loadReviewStates()
        reviewStates = Dictionary(uniqueKeysWithValues: allStates.map { ($0.cardID, $0) })

        let scriptPrefix = script == .hiragana ? "hiragana" : "katakana"
        var due: [KanaReviewCard] = []
        let now = Date()

        for entry in entries {
            for direction in [KanaDirection.kanaToRomaji, .romajiToKana] {
                let cardID = "\(entry.id.uuidString)-\(scriptPrefix)-\(direction.rawValue)"

                if reviewStates[cardID] == nil {
                    let initial = ReviewState.initial(cardID: cardID)
                    reviewStates[cardID] = initial
                }

                if let state = reviewStates[cardID], state.dueDate <= now {
                    due.append(KanaReviewCard(id: cardID, entry: entry, direction: direction))
                }
            }
        }

        StorageManager.saveReviewStates(Array(reviewStates.values))
        cards = due.shuffled()
    }

    private func handleGrade(_ grade: ReviewGrade) {
        let current = cards[currentIndex]
        guard let state = reviewStates[current.id] else { return }

        let updated = ReviewScheduler.updateReviewState(state, grade: grade)
        reviewStates[updated.cardID] = updated
        StorageManager.saveReviewStates(Array(reviewStates.values))

        if updated.isLearning && grade.rawValue < 4 {
            cards.append(current)
        }

        isFlipped = false

        if currentIndex < cards.count - 1 {
            currentIndex += 1
        } else {
            sessionComplete = true
        }
    }
}
