import SwiftUI

struct FrontCardView: View {

    let entry: Entry
    let direction: CardDirection

    var body: some View {

        VStack(alignment: .leading, spacing: 20) {

            if direction == .japaneseToEnglish {

                japaneseToEnglishFront

            } else {

                englishToJapaneseFront
            }
        }
        .padding()
    }
}

private extension FrontCardView {

    var japaneseToEnglishFront: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text(entry.word)
                .font(.largeTitle)

            VStack(alignment: .leading, spacing: 8) {

                Text("Japanese Sentence")
                    .font(.headline)

                Text(entry.exampleJapanese)
            }

            VStack(alignment: .leading, spacing: 8) {

                Text("Details")
                    .font(.headline)

                Text("Type: \(entry.wordType)")
                Text("Register: \(entry.register)")
                Text("JLPT: \(entry.jlpt)")
            }
        }
    }
}

private extension FrontCardView {

    var englishToJapaneseFront: some View {

        VStack(alignment: .leading, spacing: 16) {

            VStack(alignment: .leading, spacing: 8) {

                Text("Meanings")
                    .font(.headline)

                ForEach(entry.meanings, id: \.self) { meaning in
                    Text("• \(meaning)")
                }
            }

            VStack(alignment: .leading, spacing: 8) {

                Text("English Sentence")
                    .font(.headline)

                Text(entry.exampleEnglish)
            }

            VStack(alignment: .leading, spacing: 8) {

                Text("Details")
                    .font(.headline)

                Text("Type: \(entry.wordType)")
                Text("Register: \(entry.register)")
                Text("JLPT: \(entry.jlpt)")
            }

            if !entry.notes.isEmpty {

                VStack(alignment: .leading, spacing: 8) {

                    Text("Notes")
                        .font(.headline)

                    ForEach(entry.notes, id: \.self) { note in
                        Text("• \(note)")
                    }
                }
            }
        }
    }
}
