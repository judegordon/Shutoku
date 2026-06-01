import SwiftUI

struct MetadataChip: View {

    let text: String

    var body: some View {

        Text(text)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color.gray.opacity(0.15))
            .clipShape(Capsule())
    }
}
