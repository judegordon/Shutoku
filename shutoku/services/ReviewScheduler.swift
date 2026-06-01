import Foundation

final class ReviewScheduler {

    static func updateReviewState(
        _ state: ReviewState,
        grade: ReviewGrade
    ) -> ReviewState {

        var updatedState = state
        
        updatedState.hasBeenReviewed = true

        if state.isLearning {

            switch grade {

            case .hard:

                updatedState.dueDate = Calendar.current.date(
                    byAdding: .minute,
                    value: 5,
                    to: Date()
                ) ?? Date()

                return updatedState

            case .okay:

                updatedState.dueDate = Calendar.current.date(
                    byAdding: .minute,
                    value: 10,
                    to: Date()
                ) ?? Date()

                return updatedState

            case .good:

                updatedState.interval = 1
                updatedState.isLearning = false

            case .easy:

                updatedState.interval = 3
                updatedState.isLearning = false
            }

        } else {

            switch grade {

            case .hard:

                updatedState.dueDate = Calendar.current.date(
                    byAdding: .minute,
                    value: 5,
                    to: Date()
                ) ?? Date()

                return updatedState

            case .okay:

                updatedState.interval = max(1, state.interval)

            case .good:

                updatedState.interval = max(1, state.interval * 2)

            case .easy:

                updatedState.interval = max(1, state.interval * 5)
            }
        }

        updatedState.dueDate = Calendar.current.date(
            byAdding: .day,
            value: updatedState.interval,
            to: Date()
        ) ?? Date()

        return updatedState
    }
}
