import SwiftUI

struct CardView: View {

    let card: ReviewCard

    let onGradeSelected: (ReviewGrade) -> Void

    @State private var isRevealed = false

    var body: some View {

        VStack(spacing: 24) {

            Spacer()

            if isRevealed {

                BackCardView(
                    entry: card.entry,
                    direction: card.direction
                )

            } else {

                FrontCardView(
                    entry: card.entry,
                    direction: card.direction
                )
            }

            Spacer()

            if isRevealed {

                ReviewButtons(

                    hardText: "5m",

                    okayText: cardIsLearning
                        ? "10m"
                        : "\(cardInterval)d",

                    goodText: cardIsLearning
                        ? "1d"
                        : "\(cardInterval * 2)d",

                    easyText: cardIsLearning
                        ? "3d"
                        : "\(cardInterval * 5)d"

                ) { grade in

                    isRevealed = false

                    onGradeSelected(grade)
                }

            } else {

                Button("Reveal") {

                    isRevealed = true
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }

    private var cardInterval: Int {

        card.reviewState.interval
    }

    private var cardIsLearning: Bool {

        card.reviewState.isLearning
    }
}
