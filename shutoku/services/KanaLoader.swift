import Foundation
import SQLite

struct KanaEntry: Identifiable {
    let id: UUID
    let hiragana: String
    let katakana: String
    let romaji: String
}

final class KanaLoader {

    private static var cache: [KanaEntry]? = nil

    private static var db: Connection? = {
        guard let path = Bundle.main.path(forResource: "kana", ofType: "db") else {
            print("KanaLoader: kana.db not found in bundle")
            return nil
        }
        do {
            return try Connection(path, readonly: true)
        } catch {
            print("KanaLoader: failed to open DB — \(error)")
            return nil
        }
    }()

    static func loadAll() -> [KanaEntry] {
        if let cached = cache { return cached }
        guard let db else { return [] }

        var entries: [KanaEntry] = []

        let sql = "SELECT id, hiragana, katakana, romaji FROM kana ORDER BY romaji"

        do {
            for row in try db.prepare(sql) {
                let id = (row[0] as? String).flatMap { UUID(uuidString: $0) } ?? UUID()
                let entry = KanaEntry(
                    id: id,
                    hiragana: (row[1] as? String) ?? "",
                    katakana: (row[2] as? String) ?? "",
                    romaji:   (row[3] as? String) ?? ""
                )
                entries.append(entry)
            }
        } catch {
            print("KanaLoader: query failed — \(error)")
        }

        cache = entries
        return entries
    }

    static func clearCache() {
        cache = nil
    }
}
