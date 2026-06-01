import Foundation

struct Entry: Codable, Identifiable {
    let id: UUID

    let word: String
    let reading: String

    let meanings: [String]
    let notes: [String]

    let exampleJapanese: String
    let exampleEnglish: String

    let jlpt: String
    let wordType: String
    let register: String
}
