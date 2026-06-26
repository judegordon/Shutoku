import SwiftUI

struct VocabView: View {
    @State private var selectedDeck: Deck?
    @State private var browsingDeck: Deck?
    @State private var deckCounts: [String: (new: Int, review: Int, known: Int)] = [:]
    @State private var isLoading: Bool = false
    @State private var streaks: [String: Int] = [:]
    @State private var overallStreak: Int = 0
    
    private var vocabDecks: [Deck] {
        DeckLibrary.allDecks.filter { $0.id != "all" }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                PageHeader(japanese: "語彙", english: "VOCAB")
                
                if overallStreak > 0 {
                    HStack {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.orange)
                        Text("Overall streak: \(overallStreak) day\(overallStreak == 1 ? "" : "s")")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(12)
                }

                ForEach(vocabDecks) { deck in
                    let counts = deckCounts[deck.id] ?? (new: 0, review: 0, known: 0)

                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(deck.title)
                                .font(.title2)
                                .fontWeight(.semibold)

                            if isLoading && deckCounts.isEmpty {
                                Text("Loading...")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            } else {
                                HStack(spacing: 12) {
                                    Text("New \(counts.new)")
                                    Text("Review \(counts.review)")
                                    Text("Known \(counts.known)")
                                }
                                .font(.subheadline)
                                .foregroundColor(.gray)

                                let streak = streaks[deck.id] ?? 0
                                if streak > 0 {
                                    HStack(spacing: 4) {
                                        Image(systemName: "flame.fill")
                                            .foregroundColor(.orange)
                                        Text("\(streak) day streak")
                                            .foregroundColor(.orange)
                                    }
                                    .font(.caption)
                                }
                            }
                        }

                        HStack {
                            Button {
                                browsingDeck = deck
                            } label: {
                                Label("Browse", systemImage: "book")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)

                            Button {
                                selectedDeck = deck
                            } label: {
                                Label("Review", systemImage: "rectangle.stack")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if deckCounts.isEmpty {
                Task { await refreshCounts() }
            }
        }
        .navigationDestination(item: $selectedDeck) { deck in
            ReviewView(deck: deck) {
                selectedDeck = nil
                Task { await refreshCounts() }
            }
        }
        .navigationDestination(item: $browsingDeck) { deck in
            BrowseView(entries: DataLoader.loadEntries(from: deck))
        }
    }

    private func refreshCounts() async {
        await MainActor.run { isLoading = true }

        var counts: [String: (new: Int, review: Int, known: Int)] = [:]

        for deck in vocabDecks {
            let entries = DataLoader.loadEntries(from: deck)
            StorageManager.initializeReviewStatesIfNeeded(entries: entries)
        }

        let reviewStates = StorageManager.loadReviewStates()
        let now = Date()

        for deck in vocabDecks {
            let entries = DataLoader.loadEntries(from: deck)
            let entryIDs = Set(entries.map { $0.id.uuidString })

            let deckStates = reviewStates.filter { state in
                entryIDs.contains { state.cardID.hasPrefix($0) }
            }

            counts[deck.id] = (
                new: deckStates.filter { !$0.hasBeenReviewed }.count,
                review: deckStates.filter { $0.hasBeenReviewed && $0.dueDate <= now }.count,
                known: deckStates.filter { $0.hasBeenReviewed && $0.dueDate > now }.count
            )
        }

        await MainActor.run {
            deckCounts = counts
            isLoading = false
            for deck in vocabDecks {
                streaks[deck.id] = StreakManager.streak(for: deck.id)
            }
            overallStreak = StreakManager.overallStreak()
        }
    }
}
