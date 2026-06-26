// ReviewState.swift
import Foundation

struct ReviewState: Codable {
    let cardID: String
    var repetitions: Int
    var interval: Int
    var easeFactor: Double
    var dueDate: Date
    var isLearning: Bool
    var hasBeenReviewed: Bool
    
    static func initial(cardID: String) -> ReviewState {
        ReviewState(
            cardID: cardID,
            repetitions: 0,
            interval: 0,
            easeFactor: 2.5,
            dueDate: Date(),
            isLearning: true,
            hasBeenReviewed: false
        )
    }
}
