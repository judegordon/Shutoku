import SwiftUI

struct HomeView: View {
    @State private var destination: AppDestination?
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    private var menuItems: [(title: String, subtitle: String, systemImage: String, dest: AppDestination)] = [
        ("Dictionary", "Browse all vocabulary", "book", .dictionary),
        ("Vocab", "Study by JLPT level", "rectangle.stack", .vocab),
        ("Kana", "Hiragana & Katakana", "character.ja", .kana),
        ("Grammar", "Core grammar points", "text.book.closed", .grammar),
        ("Translations", "Practice with AI feedback", "bubble.left.and.bubble.right", .translations),
        ("Getting Started", "How to use Shutoku", "star", .gettingStarted),
        ("Settings", "Preferences and options", "gearshape", .settings)
    ]

    private var isIPad: Bool { horizontalSizeClass == .regular }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    VStack(spacing: 4) {
                        Text("習得")
                            .font(.system(size: isIPad ? 72 : 48, weight: .bold))
                        Text("Shutoku")
                            .font(isIPad ? .title : .title3)
                            .foregroundColor(.secondary)
                            .kerning(4)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, isIPad ? 48 : 32)
                    .background(.regularMaterial)
                    .cornerRadius(12)

                    if isIPad {
                        GeometryReader { geometry in
                            let cardHeight = (geometry.size.height - 16 * 3) / 4
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(menuItems, id: \.title) { item in
                                    GridMenuButton(
                                        title: item.title,
                                        subtitle: item.subtitle,
                                        systemImage: item.systemImage,
                                        isIPad: true
                                    ) { destination = item.dest }
                                    .frame(height: cardHeight)
                                }
                            }
                        }
                        .frame(height: UIScreen.main.bounds.height - 280)
                    } else {
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(menuItems, id: \.title) { item in
                                GridMenuButton(
                                    title: item.title,
                                    subtitle: item.subtitle,
                                    systemImage: item.systemImage,
                                    isIPad: false
                                ) { destination = item.dest }
                                .frame(height: 120)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
            .navigationDestination(item: $destination) { dest in
                switch dest {
                case .dictionary: DictionaryView()
                case .vocab: VocabView()
                case .kana: KanaView()
                case .grammar: GrammarView()
                case .translations: TranslationsView()
                case .gettingStarted: GettingStartedView()
                case .settings: SettingsView()
                }
            }
        }
    }
}

enum AppDestination: String, Hashable, Identifiable {
    case dictionary, vocab, kana, grammar, translations, gettingStarted, settings
    var id: String { rawValue }
}

struct GridMenuButton: View {
    let title: String
    let subtitle: String
    let systemImage: String
    let isIPad: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: isIPad ? 16 : 10) {
                Image(systemName: systemImage)
                    .font(isIPad ? .system(size: 56) : .system(size: 28))
                    .foregroundColor(.blue)

                VStack(alignment: .leading, spacing: isIPad ? 8 : 3) {
                    Text(title)
                        .font(isIPad ? .system(size: 28, weight: .semibold) : .headline)
                        .foregroundColor(.primary)
                    Text(subtitle)
                        .font(isIPad ? .system(size: 20) : .caption)
                        .foregroundColor(.secondary)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding(isIPad ? 28 : 16)
            .background(.regularMaterial)
            .cornerRadius(12)
        }
        .buttonStyle(.plain)
    }
}

typealias MenuButton = GridMenuButton
