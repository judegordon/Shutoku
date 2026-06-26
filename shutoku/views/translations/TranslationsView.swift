import SwiftUI

enum TranslationMode: String, CaseIterable {
    case japaneseToEnglish = "J → E"
    case englishToJapanese = "E → J"
}

struct TranslationsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                PageHeader(japanese: "翻訳", english: "TRANSLATIONS")

                NavigationLink(destination: TranslationSessionView(mode: .japaneseToEnglish)) {
                    HStack(spacing: 16) {
                        Image(systemName: "j.circle")
                            .font(.title2)
                            .frame(width: 36)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Japanese → English")
                                .font(.headline)
                            Text("Read Japanese, translate to English")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(12)
                }
                .buttonStyle(.plain)

                NavigationLink(destination: TranslationSessionView(mode: .englishToJapanese)) {
                    HStack(spacing: 16) {
                        Image(systemName: "e.circle")
                            .font(.title2)
                            .frame(width: 36)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("English → Japanese")
                                .font(.headline)
                            Text("Read English, translate to Japanese")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(12)
                }
                .buttonStyle(.plain)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
