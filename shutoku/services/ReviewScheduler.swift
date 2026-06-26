// ReviewScheduler.swift
import Foundation

final class ReviewScheduler {

    private static let minimumEaseFactor: Double = 1.3
    private static let easyBonus: Double = 1.3
    private static let hardPenalty: Double = 0.5

    static func updateReviewState(
        _ state: ReviewState,
        grade: ReviewGrade
    ) -> ReviewState {

        var updatedState = state
        updatedState.hasBeenReviewed = true

        let quality = grade.rawValue

        // --- Learning phase ---
        if state.isLearning {
            switch grade {
            case .again:
                // Complete miss — back to start
                updatedState.dueDate = Calendar.current.date(
                    byAdding: .minute, value: 1, to: Date()
                ) ?? Date()
                updatedState.repetitions = 0
                return updatedState

            case .difficult:
                // Wrong but had some memory — try again soon
                updatedState.dueDate = Calendar.current.date(
                    byAdding: .minute, value: 5, to: Date()
                ) ?? Date()
                return updatedState

            case .okay:
                // Got it but really struggled — requeue with longer step
                updatedState.dueDate = Calendar.current.date(
                    byAdding: .minute, value: 10, to: Date()
                ) ?? Date()
                return updatedState

            case .good:
                // Solid first correct answer — graduate to review phase
                updatedState.isLearning = false
                updatedState.repetitions = 1
                updatedState.interval = 1

            case .easy:
                // Instant recall as new card — give a head start
                updatedState.isLearning = false
                updatedState.repetitions = 2
                updatedState.interval = 3
            }
        }

        // --- Review phase ---
        switch grade {

        case .again:
            // Complete fail — back to learning with a longer step than new cards
            updatedState.repetitions = 0
            updatedState.isLearning = true
            updatedState.interval = 0
            let newEF = state.easeFactor + (0.1 - Double(5 - quality) * (0.08 + Double(5 - quality) * 0.02))
            updatedState.easeFactor = max(minimumEaseFactor, newEF)
            updatedState.dueDate = Calendar.current.date(
                byAdding: .minute, value: 10, to: Date()
            ) ?? Date()
            return updatedState

        case .difficult:
            // Wrong but familiar — cut interval in half, stay in review
            let reducedInterval = max(1, Int((Double(state.interval) * hardPenalty).rounded()))
            updatedState.interval = reducedInterval
            updatedState.repetitions = max(1, updatedState.repetitions)
            let newEF = state.easeFactor + (0.1 - Double(5 - quality) * (0.08 + Double(5 - quality) * 0.02))
            updatedState.easeFactor = max(minimumEaseFactor, newEF)
            updatedState.dueDate = Calendar.current.date(
                byAdding: .day, value: reducedInterval, to: Date()
            ) ?? Date()
            return updatedState

        case .okay:
            // Got it but struggled — keep same interval, no growth
            let sameInterval = max(1, state.interval)
            updatedState.interval = sameInterval
            updatedState.repetitions = max(1, updatedState.repetitions)
            let newEF = state.easeFactor + (0.1 - Double(5 - quality) * (0.08 + Double(5 - quality) * 0.02))
            updatedState.easeFactor = max(minimumEaseFactor, newEF)
            updatedState.dueDate = Calendar.current.date(
                byAdding: .day, value: sameInterval, to: Date()
            ) ?? Date()
            return updatedState

        case .good:
            let newInterval: Int
            switch updatedState.repetitions {
            case 0: newInterval = 1
            case 1: newInterval = 6
            default:
                newInterval = max(1, Int((Double(updatedState.interval) * updatedState.easeFactor).rounded()))
            }
            let newEF = state.easeFactor + (0.1 - Double(5 - quality) * (0.08 + Double(5 - quality) * 0.02))
            updatedState.easeFactor = max(minimumEaseFactor, newEF)
            updatedState.interval = newInterval
            updatedState.repetitions += 1
            updatedState.dueDate = Calendar.current.date(
                byAdding: .day, value: newInterval, to: Date()
            ) ?? Date()
            return updatedState

        case .easy:
            let newInterval: Int
            switch updatedState.repetitions {
            case 0: newInterval = 1
            case 1: newInterval = 6
            default:
                newInterval = max(1, Int((Double(updatedState.interval) * updatedState.easeFactor * easyBonus).rounded()))
            }
            let newEF = state.easeFactor + (0.1 - Double(5 - quality) * (0.08 + Double(5 - quality) * 0.02))
            updatedState.easeFactor = max(minimumEaseFactor, newEF)
            updatedState.interval = newInterval
            updatedState.repetitions += 1
            updatedState.dueDate = Calendar.current.date(
                byAdding: .day, value: newInterval, to: Date()
            ) ?? Date()
            return updatedState
        }
    }

    // MARK: - Interval Preview

    static func previewIntervals(
        for state: ReviewState
    ) -> (again: String, difficult: String, okay: String, good: String, easy: String) {
        (
            again: previewInterval(state: state, grade: .again),
            difficult: previewInterval(state: state, grade: .difficult),
            okay: previewInterval(state: state, grade: .okay),
            good: previewInterval(state: state, grade: .good),
            easy: previewInterval(state: state, grade: .easy)
        )
    }

    private static func previewInterval(
        state: ReviewState,
        grade: ReviewGrade
    ) -> String {
        let updated = updateReviewState(state, grade: grade)

        if updated.isLearning {
            let minutes = Int(updated.dueDate.timeIntervalSinceNow / 60)
            return "\(max(1, minutes))m"
        } else {
            return "\(updated.interval)d"
        }
    }
}
