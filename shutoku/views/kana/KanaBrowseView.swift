import SwiftUI

struct KanaBrowseView: View {
    let script: KanaScript
    let entries: [KanaEntry]

    @State private var searchText: String = ""

    private var filtered: [KanaEntry] {
        if searchText.isEmpty { return entries }
        return entries.filter {
            $0.hiragana.contains(searchText) ||
            $0.katakana.contains(searchText) ||
            $0.romaji.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        List(filtered) { entry in
            HStack(spacing: 20) {
                Text(script == .hiragana ? entry.hiragana : entry.katakana)
                    .font(.system(size: 32))
                    .frame(width: 48)

                Text(script == .hiragana ? entry.katakana : entry.hiragana)
                    .font(.system(size: 24))
                    .foregroundColor(.secondary)
                    .frame(width: 48)

                Text(entry.romaji)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 4)
        }
        .searchable(text: $searchText, prompt: "Search kana or romaji")
        .listStyle(.plain)
        .navigationTitle(script.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}
