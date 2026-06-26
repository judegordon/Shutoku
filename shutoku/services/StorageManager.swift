import Foundation

final class StorageManager {

    // In-memory cache
    private static var cachedStates: [ReviewState]? = nil

    // MARK: - File URL

    private static var reviewStatesURL: URL {
        let documents = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0]
        return documents.appendingPathComponent("reviewStates.json")
    }

    // MARK: - Save

    static func saveReviewStates(_ states: [ReviewState]) {
        cachedStates = states
        do {
            let data = try JSONEncoder().encode(states)
            try data.write(to: reviewStatesURL, options: .atomic)
        } catch {
            print("Failed to save review states: \(error)")
        }
    }

    // MARK: - Load

    static func loadReviewStates() -> [ReviewState] {
        if let cached = cachedStates {
            return cached
        }

        guard FileManager.default.fileExists(atPath: reviewStatesURL.path) else {
            return []
        }

        do {
            let data = try Data(contentsOf: reviewStatesURL)
            let states = try JSONDecoder().decode([ReviewState].self, from: data)
            cachedStates = states
            return states
        } catch {
            print("Failed to load review states: \(error)")
            return []
        }
    }

    // MARK: - Initialise

    static func initializeReviewStatesIfNeeded(entries: [Entry]) {
        var statesByID: [String: ReviewState] = [:]
        for state in loadReviewStates() {
            statesByID[state.cardID] = state
        }

        var didAddNew = false
        for entry in entries {
            let cardIDs = [
                "\(entry.id.uuidString)-japaneseToEnglish",
                "\(entry.id.uuidString)-englishToJapanese"
            ]
            for cardID in cardIDs {
                if statesByID[cardID] == nil {
                    statesByID[cardID] = ReviewState.initial(cardID: cardID)
                    didAddNew = true
                }
            }
        }

        if didAddNew {
            saveReviewStates(Array(statesByID.values))
        }
    }

    // MARK: - Clear Cache

    static func clearCache() {
        cachedStates = nil
    }
}
