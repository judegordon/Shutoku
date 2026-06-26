import SwiftUI

struct GrammarView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                PageHeader(japanese: "文法", english: "GRAMMAR")

                ForEach(GrammarCategory.allCases) { category in
                    NavigationLink(destination: GrammarCategoryView(category: category)) {
                        HStack(spacing: 16) {
                            Image(systemName: "text.book.closed")
                                .font(.title2)
                                .frame(width: 36)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(category.rawValue)
                                    .font(.headline)
                                let count = GrammarLibrary.points(for: category).count
                                Text("\(count) point\(count == 1 ? "" : "s")")
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
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
