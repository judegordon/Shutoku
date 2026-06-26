import SwiftUI

struct GrammarCategoryView: View {
    let category: GrammarCategory
    @State private var searchText: String = ""

    private var points: [GrammarPoint] {
        let all = GrammarLibrary.points(for: category)
        if searchText.isEmpty { return all }
        return all.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.englishExplanation.localizedCaseInsensitiveContains(searchText) ||
            $0.simplifiedRule.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        List(points) { point in
            NavigationLink(destination: GrammarDetailView(point: point)) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(point.title)
                        .font(.headline)
                    Text(point.simplifiedRule)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
        }
        .searchable(text: $searchText, prompt: "Search grammar points")
        .listStyle(.plain)
        .navigationTitle(category.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}
