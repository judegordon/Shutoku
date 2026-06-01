import SwiftUI

struct EntryDetailView: View {

    let entry: Entry

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                VStack(alignment: .leading, spacing: 8) {

                    Text(entry.word)
                        .font(.largeTitle)

                    Text(entry.reading)
                        .font(.title3)
                        .foregroundColor(.gray)
                }

                VStack(alignment: .leading, spacing: 8) {

                    Text("Meanings")
                        .font(.headline)

                    ForEach(entry.meanings, id: \.self) { meaning in
                        Text("• \(meaning)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {

                    Text("Example")
                        .font(.headline)

                    Text(entry.exampleJapanese)

                    Text(entry.exampleEnglish)
                        .foregroundColor(.gray)
                }

                VStack(alignment: .leading, spacing: 8) {

                    Text("Details")
                        .font(.headline)

                    Text("JLPT: \(entry.jlpt)")
                    Text("Type: \(entry.wordType)")
                    Text("Register: \(entry.register)")
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
            .padding()
        }
        .navigationTitle(entry.word)
        .navigationBarTitleDisplayMode(.inline)
    }
}
