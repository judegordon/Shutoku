import SwiftUI

struct GrammarDetailView: View {
    let point: GrammarPoint

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                VStack(alignment: .leading, spacing: 8) {
                    Text(point.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(point.simplifiedRule)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }

                Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text("English")
                        .font(.headline)
                    Text(point.englishExplanation)
                        .font(.body)
                }

                Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text("日本語")
                        .font(.headline)
                    Text(point.japaneseExplanation)
                        .font(.body)
                }

                Divider()

                VStack(alignment: .leading, spacing: 12) {
                    Text("Examples")
                        .font(.headline)

                    ForEach(point.examples) { example in
                        VStack(alignment: .leading, spacing: 4) {
                            if let register = example.register {
                                Text(register.rawValue)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Text(example.japanese)
                                .font(.body)
                            Text(example.english)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                }

                if let notes = point.nuanceNotes {
                    Divider()
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Notes")
                            .font(.headline)
                        Text(notes)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(point.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
