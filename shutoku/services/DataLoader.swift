import Foundation
import SQLite

final class DataLoader {

    private static var cache: [String: [Entry]] = [:]

    private static var db: Connection? = {
        guard let path = Bundle.main.path(forResource: "vocab", ofType: "db") else {
            print("DataLoader: vocab.db not found in bundle")
            return nil
        }
        do {
            return try Connection(path, readonly: true)
        } catch {
            print("DataLoader: failed to open DB — \(error)")
            return nil
        }
    }()

    static func loadEntries(from deck: Deck) -> [Entry] {
        let cacheKey = deck.fileNames.joined(separator: ",")
        if let cached = cache[cacheKey] { return cached }
        guard let db else { return [] }

        let levels = Set(deck.fileNames.compactMap { jlptLevel(from: $0) })
        let entries = queryEntries(db: db, jlptLevels: levels)
        cache[cacheKey] = entries
        return entries
    }

    static func clearCache() {
        cache = [:]
    }

    // MARK: - Private

    private static func jlptLevel(from fileName: String) -> String? {
        if fileName.lowercased().contains("extras") { return "Extras" }
        let pattern = /(?i)(n[1-5])/
        guard let match = fileName.firstMatch(of: pattern) else { return nil }
        return match.output.1.uppercased()
    }

    private static func parseMeaningsAndNotes(from translation: String)
        -> (meanings: [String], notes: [String])
    {
        var meanings: [String] = []
        var notes: [String] = []

        let parts = translation
            .split(separator: "|")
            .map { $0.trimmingCharacters(in: .whitespaces) }

        for part in parts {
            if let openParen = part.firstIndex(of: "("),
               let closeParen = part.lastIndex(of: ")"),
               openParen < closeParen
            {
                let meaning = part[part.startIndex..<openParen]
                    .trimmingCharacters(in: .whitespaces)
                let note = String(part[part.index(after: openParen)..<closeParen])
                    .trimmingCharacters(in: .whitespaces)

                if !meaning.isEmpty { meanings.append(meaning) }
                if !note.isEmpty    { notes.append(note) }
            } else {
                if !part.isEmpty { meanings.append(part) }
            }
        }

        return (meanings, notes)
    }

    private static func queryEntries(db: Connection, jlptLevels: Set<String>) -> [Entry] {
        var entries: [Entry] = []

        let levelList = jlptLevels
            .map { "'\($0)'" }
            .joined(separator: ", ")

        let sql = jlptLevels.isEmpty
            ? "SELECT id, Kanji, Kana, Translation, Japanese, English, JLPT, POS, Formality FROM cards ORDER BY Translation"
            : "SELECT id, Kanji, Kana, Translation, Japanese, English, JLPT, POS, Formality FROM cards WHERE JLPT IN (\(levelList)) ORDER BY Translation"

        do {
            for row in try db.prepare(sql) {
                let id      = (row[0] as? String).flatMap { UUID(uuidString: $0) } ?? UUID()
                let word    = (row[1] as? String) ?? (row[2] as? String) ?? ""
                let reading = (row[2] as? String) ?? ""
                let (meanings, notes) = parseMeaningsAndNotes(from: (row[3] as? String) ?? "")

                let entry = Entry(
                    id: id,
                    word: word,
                    reading: reading,
                    meanings: meanings,
                    notes: notes,
                    exampleJapanese: (row[4] as? String) ?? "",
                    exampleEnglish:  (row[5] as? String) ?? "",
                    jlpt:     (row[6] as? String) ?? "",
                    wordType: (row[7] as? String) ?? "",
                    register: (row[8] as? String) ?? ""
                )
                entries.append(entry)
            }
        } catch {
            print("DataLoader: query failed — \(error)")
        }
        return entries
    }
}
