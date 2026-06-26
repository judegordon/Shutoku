// CardView.swift
import SwiftUI

struct CardView: View {

    let card: ReviewCard
    let onGradeSelected: (ReviewGrade) -> Void

    @State private var isRevealed = false

    private var intervals: (again: String, difficult: String, okay: String, good: String, easy: String) {
        ReviewScheduler.previewIntervals(for: card.reviewState)
    }

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
                    againText: intervals.again,
                    difficultText: intervals.difficult,
                    okayText: intervals.okay,
                    goodText: intervals.good,
                    easyText: intervals.easy
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
        .onChange(of: card.id) {
            isRevealed = false
        }
    }
}
