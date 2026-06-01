import SwiftUI

struct BackCardView: View {

    let entry: Entry
    let direction: CardDirection

    var body: some View {

        VStack(alignment: .leading, spacing: 20) {

            if direction == .japaneseToEnglish {

                japaneseToEnglishBack

            } else {

                englishToJapaneseBack
            }
        }
        .padding()
    }
}

private extension BackCardView {

    var japaneseToEnglishBack: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text(entry.reading)
                .font(.title2)
                .foregroundColor(.gray)

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

private extension BackCardView {

    var englishToJapaneseBack: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text(entry.word)
                .font(.largeTitle)

            Text(entry.reading)
                .font(.title3)
                .foregroundColor(.gray)

            VStack(alignment: .leading, spacing: 8) {

                Text("Japanese Sentence")
                    .font(.headline)

                Text(entry.exampleJapanese)
            }
        }
    }
}
