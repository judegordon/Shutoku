import Foundation

struct ReviewCard: Identifiable {
    let id: String
    let entry: Entry
    let direction: CardDirection
    let reviewState: ReviewState
}
