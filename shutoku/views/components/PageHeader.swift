import SwiftUI

struct PageHeader: View {
    let japanese: String
    let english: String

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    private var isIPad: Bool { horizontalSizeClass == .regular }

    var body: some View {
        VStack(spacing: 4) {
            Text(japanese)
                .font(.system(size: isIPad ? 72 : 48, weight: .bold))
            Text(english)
                .font(isIPad ? .title : .title3)
                .foregroundColor(.secondary)
                .kerning(4)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, isIPad ? 40 : 24)
        .background(.regularMaterial)
        .cornerRadius(12)
    }
}
