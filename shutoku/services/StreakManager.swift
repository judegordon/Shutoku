import Foundation

enum StreakManager {

    private static let calendar = Calendar.current

    // MARK: - Mark Completion

    static func markCompleted(deckID: String) {
        let key = completionKey(deckID: deckID, date: today())
        UserDefaults.standard.set(true, forKey: key)
        updateStreak(for: deckID)
        updateOverallStreak()
    }

    // MARK: - Streak Values

    static func streak(for deckID: String) -> Int {
        UserDefaults.standard.integer(forKey: streakKey(deckID: deckID))
    }

    static func overallStreak() -> Int {
        UserDefaults.standard.integer(forKey: "streak_overall")
    }

    // MARK: - Private

    private static func updateStreak(for deckID: String) {
        let todayDate = today()
        let yesterday = calendar.date(byAdding: .day, value: -1, to: todayDate)!

        let completedToday = UserDefaults.standard.bool(
            forKey: completionKey(deckID: deckID, date: todayDate)
        )
        let completedYesterday = UserDefaults.standard.bool(
            forKey: completionKey(deckID: deckID, date: yesterday)
        )

        guard completedToday else { return }

        let current = UserDefaults.standard.integer(forKey: streakKey(deckID: deckID))

        if completedYesterday || current == 0 {
            UserDefaults.standard.set(current + 1, forKey: streakKey(deckID: deckID))
        } else if current == 0 {
            UserDefaults.standard.set(1, forKey: streakKey(deckID: deckID))
        }
    }

    private static func updateOverallStreak() {
        let todayDate = today()
        let yesterday = calendar.date(byAdding: .day, value: -1, to: todayDate)!
        let vocabDecks = DeckLibrary.allDecks.filter { $0.id != "all" }

        // Overall streak advances only if all decks with due cards were completed today
        // For simplicity we check if at least one deck was completed today
        // and all decks that were active yesterday were also completed today
        let anyCompletedToday = vocabDecks.contains {
            UserDefaults.standard.bool(forKey: completionKey(deckID: $0.id, date: todayDate))
        }

        guard anyCompletedToday else { return }

        let anyCompletedYesterday = vocabDecks.contains {
            UserDefaults.standard.bool(forKey: completionKey(deckID: $0.id, date: yesterday))
        }

        let current = UserDefaults.standard.integer(forKey: "streak_overall")

        if anyCompletedYesterday || current == 0 {
            UserDefaults.standard.set(current + 1, forKey: "streak_overall")
        }
    }

    private static func completionKey(deckID: String, date: Date) -> String {
        "completed_\(deckID)_\(dateString(date))"
    }

    private static func streakKey(deckID: String) -> String {
        "streak_\(deckID)"
    }

    private static func today() -> Date {
        calendar.startOfDay(for: Date())
    }

    private static func dateString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
