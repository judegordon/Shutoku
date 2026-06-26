import Foundation

enum DailyLimitManager {

    private static let defaultLimit = 10

    static func limit(for deckID: String) -> Int {
        let key = "dailyLimit_\(deckID)"
        guard UserDefaults.standard.object(forKey: key) != nil else {
            return defaultLimit
        }
        return UserDefaults.standard.integer(forKey: key)
    }

    static func setLimit(_ limit: Int, for deckID: String) {
        UserDefaults.standard.set(limit, forKey: "dailyLimit_\(deckID)")
    }
}
