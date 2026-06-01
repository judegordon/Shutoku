import SwiftUI

struct ReviewView: View {
let deck: Deck

let onReturnHome: () -> Void

@State private var cards: [ReviewCard] = []

@State private var reviewStates: [ReviewState] = []

@State private var currentIndex = 0

@State private var sessionComplete = false

var body: some View {

    VStack {

        if cards.isEmpty {

            Text("No cards available")

        } else {

            CardView(
                card: currentCard,
                onGradeSelected: handleGrade
            )
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

        loadDueCards()
    }
}

private var currentCard: ReviewCard {

    cards[currentIndex]
}

private func loadDueCards() {

    let entries = DataLoader.loadEntries(
        from: deck
    )

    StorageManager.initializeReviewStatesIfNeeded(
        entries: entries
    )

    reviewStates = StorageManager.loadReviewStates()

    cards = generateDueCards(
        from: entries,
        reviewStates: reviewStates
    )
}

private func handleGrade(_ grade: ReviewGrade) {

    let currentCardCopy = currentCard

    let currentState = reviewStates.first {

        $0.cardID == currentCardCopy.id
    }

    guard let state = currentState else {

        return
    }

    let updatedState = ReviewScheduler.updateReviewState(
        state,
        grade: grade
    )

    if let index = reviewStates.firstIndex(where: {

        $0.cardID == currentCardCopy.id

    }) {

        reviewStates[index] = updatedState

        print("UPDATED")
        print(updatedState.cardID)
        print("reviewed:", updatedState.hasBeenReviewed)
        print("due:", updatedState.dueDate)
    }

    StorageManager.saveReviewStates(
        reviewStates
    )

    if let savedState = reviewStates.first(where: {

        $0.cardID == currentCardCopy.id

    }) {

        print("SAVED")
        print(savedState.cardID)
        print("reviewed:", savedState.hasBeenReviewed)
    }

    if updatedState.isLearning &&
        (grade == .hard || grade == .okay) {

        let updatedCard = ReviewCard(
            id: currentCardCopy.id,
            entry: currentCardCopy.entry,
            direction: currentCardCopy.direction,
            reviewState: updatedState
        )

        cards.append(updatedCard)
    }

    if currentIndex < cards.count - 1 {

        currentIndex += 1

    } else {

        sessionComplete = true
    }
}

private func generateDueCards(
    from entries: [Entry],
    reviewStates: [ReviewState]
) -> [ReviewCard] {

    var generatedCards: [ReviewCard] = []

    for entry in entries {

        let japaneseToEnglishID =
            "\(entry.id.uuidString)-japaneseToEnglish"

        let englishToJapaneseID =
            "\(entry.id.uuidString)-englishToJapanese"

        if let state = reviewStates.first(where: {

            $0.cardID == japaneseToEnglishID &&
            $0.dueDate <= Date()

        }) {

            generatedCards.append(
                ReviewCard(
                    id: state.cardID,
                    entry: entry,
                    direction: .japaneseToEnglish,
                    reviewState: state
                )
            )
        }

        if let state = reviewStates.first(where: {

            $0.cardID == englishToJapaneseID &&
            $0.dueDate <= Date()

        }) {

            generatedCards.append(
                ReviewCard(
                    id: state.cardID,
                    entry: entry,
                    direction: .englishToJapanese,
                    reviewState: state
                )
            )
        }
    }

    return generatedCards.shuffled()
}

}

