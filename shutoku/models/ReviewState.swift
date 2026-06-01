import Foundation

struct ReviewState: Codable {
    let cardID: String
    var interval: Int
    var easeFactor: Double
    var dueDate: Date
    var isLearning: Bool
    var hasBeenReviewed: Bool
}
