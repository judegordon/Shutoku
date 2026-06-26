import SwiftUI

enum DictionaryFilter: String, CaseIterable {
    case all = "All"
    case new = "New"
    case review = "Review"
    case known = "Known"
}

struct DictionaryView: View {
    @State private var selectedFilter: DictionaryFilter = .all
    @State private var searchText: String = ""
    @State private var allEntries: [Entry] = []

    private var filteredEntries: [Entry] {
        let states = StorageManager.loadReviewStates()
        let stateMap = Dictionary(uniqueKeysWithValues: states.map { ($0.cardID, $0) })

        let byFilter: [Entry]
        switch selectedFilter {
        case .all:
            byFilter = allEntries
        case .new:
            byFilter = allEntries.filter { entry in
                let cardID = "\(entry.id.uuidString)-japaneseToEnglish"
                guard let state = stateMap[cardID] else { return true }
                return !state.hasBeenReviewed
            }
        case .review:
            byFilter = allEntries.filter { entry in
                let cardID = "\(entry.id.uuidString)-japaneseToEnglish"
                guard let state = stateMap[cardID] else { return false }
                return state.hasBeenReviewed && state.dueDate <= Date()
            }
        case .known:
            byFilter = allEntries.filter { entry in
                let cardID = "\(entry.id.uuidString)-japaneseToEnglish"
                guard let state = stateMap[cardID] else { return false }
                return state.hasBeenReviewed && state.dueDate > Date()
            }
        }

        if searchText.isEmpty { return byFilter }
        return byFilter.filter {
            $0.word.contains(searchText) ||
            $0.reading.contains(searchText) ||
            $0.meanings.joined().localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            PageHeader(japanese: "辞書", english: "DICTIONARY")
                .padding(.horizontal)
                .padding(.top)

            Picker("Filter", selection: $selectedFilter) {
                ForEach(DictionaryFilter.allCases, id: \.self) { filter in
                    Text(filter.rawValue).tag(filter)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            List(filteredEntries) { entry in
                NavigationLink(destination: EntryDetailView(entry: entry)) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(entry.word)
                            .font(.headline)
                        Text(entry.reading)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(entry.meanings.first ?? "")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search words, readings, meanings")
            .listStyle(.plain)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if allEntries.isEmpty {
                allEntries = DataLoader.loadEntries(from: DeckLibrary.allDecks[0])
            }
        }
    }
}
