import SwiftUI

enum KanaScript: String, CaseIterable {
    case hiragana = "Hiragana"
    case katakana = "Katakana"
}

struct KanaView: View {
    @State private var selectedScript: KanaScript?
    @State private var browsingScript: KanaScript?

    private var allEntries: [KanaEntry] = KanaLoader.loadAll()

    private func entries(for script: KanaScript) -> [KanaEntry] {
        allEntries
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                PageHeader(japanese: "仮名", english: "KANA")

                ForEach(KanaScript.allCases, id: \.self) { script in
                    VStack(alignment: .leading, spacing: 12) {
                        Text(script.rawValue)
                            .font(.title2)
                            .fontWeight(.semibold)

                        HStack {
                            Button {
                                browsingScript = script
                            } label: {
                                Label("Browse", systemImage: "book")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)

                            Button {
                                selectedScript = script
                            } label: {
                                Label("Review", systemImage: "rectangle.stack")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(item: $selectedScript) { script in
            KanaReviewView(script: script, entries: allEntries)
        }
        .navigationDestination(item: $browsingScript) { script in
            KanaBrowseView(script: script, entries: allEntries)
        }
    }
}

extension KanaScript: Identifiable {
    var id: String { rawValue }
}
