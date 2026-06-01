import SwiftUI

struct HomeView: View {
@State private var selectedDeck: Deck?

var body: some View {

    NavigationStack {

        VStack(spacing: 16) {

            ForEach(DeckLibrary.allDecks) { deck in

                let counts = cardCounts(for: deck)

                Button {

                    selectedDeck = deck

                } label: {

                    HStack {

                        VStack(
                            alignment: .leading,
                            spacing: 6
                        ) {

                            Text(deck.title)
                                .font(.title2)
                                .fontWeight(.semibold)

                            HStack(spacing: 12) {

                                Text("New \(counts.new)")

                                Text("Review \(counts.review)")

                                Text("Known \(counts.known)")
                            }
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }

                        Spacer()
                    }
                    .padding()
                }
                .buttonStyle(.bordered)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Shutoku")
        .navigationDestination(item: $selectedDeck) { deck in

            ReviewView(deck: deck) {

                selectedDeck = nil
            }
        }
    }
}

private func cardCounts(
    for deck: Deck
) -> (
    new: Int,
    review: Int,
    known: Int
) {

    let entries = DataLoader.loadEntries(
        from: deck
    )

    StorageManager.initializeReviewStatesIfNeeded(
        entries: entries
    )

    let entryIDs = Set(
        entries.map {
            $0.id.uuidString
        }
    )

    let reviewStates = StorageManager.loadReviewStates()

    let deckStates = reviewStates.filter { state in

        entryIDs.contains { entryID in

            state.cardID.hasPrefix(
                entryID
            )
        }
    }

    let newCount = deckStates.filter {

        !$0.hasBeenReviewed

    }.count

    let reviewCount = deckStates.filter {

        $0.hasBeenReviewed &&
        $0.dueDate <= Date()

    }.count

    let knownCount = deckStates.filter {

        $0.hasBeenReviewed &&
        $0.dueDate > Date()

    }.count

    return (
        new: newCount,
        review: reviewCount,
        known: knownCount
    )
}

}

