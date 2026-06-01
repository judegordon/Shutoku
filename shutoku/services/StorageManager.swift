import Foundation

final class StorageManager {
    private static let reviewStatesKey = "reviewStates"
    static func saveReviewStates(_ states: [ReviewState]) {

        do {

            let data = try JSONEncoder().encode(states)

            UserDefaults.standard.set(
                data,
                forKey: reviewStatesKey
            )

        } catch {

            print("Failed to save review states: \(error)")
        }
    }

    static func loadReviewStates() -> [ReviewState] {

    guard let data = UserDefaults.standard.data(
        forKey: reviewStatesKey
    ) else {

        print("NO SAVED REVIEW STATES")

        return []
    }

    do {

        let states = try JSONDecoder().decode(
            [ReviewState].self,
            from: data
        )

        print("LOADED \(states.count) STATES")

        if let first = states.first {

            print("FIRST STATE:")
            print(first)
        }

        let reviewedCount = states.filter {
            $0.hasBeenReviewed
        }.count

        print("REVIEWED STATES: \(reviewedCount)")

        return states

    } catch {

        print("Failed to load review states: \(error)")

        return []
    }

    }


    static func initializeReviewStatesIfNeeded(
        entries: [Entry]
    ) {

        var states = loadReviewStates()

        var uniqueStates: [ReviewState] = []

        var seenCardIDs = Set<String>()

        for state in states {

            if !seenCardIDs.contains(state.cardID) {

                uniqueStates.append(state)

                seenCardIDs.insert(state.cardID)
            }
        }

        states = uniqueStates

        var statesByID: [String: ReviewState] = [:]

        for state in states {

            statesByID[state.cardID] = state
        }

        for entry in entries {

            let cardIDs = [

                "\(entry.id.uuidString)-japaneseToEnglish",

                "\(entry.id.uuidString)-englishToJapanese"
            ]

            for cardID in cardIDs {

                if statesByID[cardID] == nil {

                    let newState = ReviewState(
                        cardID: cardID,
                        interval: 1,
                        easeFactor: 2.5,
                        dueDate: Date(),
                        isLearning: true,
                        hasBeenReviewed: false
                    )

                    states.append(newState)

                    statesByID[cardID] = newState
                }
            }
        }

        saveReviewStates(states)
    }
}
