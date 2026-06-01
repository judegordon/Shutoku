import SwiftUI

struct BrowseView: View {

    let entries: [Entry]

    var body: some View {

        NavigationStack {

            List(entries) { entry in

                VStack(alignment: .leading, spacing: 4) {

                    Text(entry.word)
                        .font(.title3)

                    Text(entry.reading)
                        .foregroundColor(.gray)

                    Text(entry.meanings.first ?? "")
                        .font(.subheadline)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Browse")
        }
    }
}
