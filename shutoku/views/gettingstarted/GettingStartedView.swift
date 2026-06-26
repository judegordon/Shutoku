import SwiftUI

struct GettingStartedView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                PageHeader(japanese: "始め方", english: "GETTING STARTED")

                // Welcome
                InfoCard(title: "Welcome to Shutoku", icon: "hand.wave") {
                    Text("Shutoku (習得) means acquisition or mastery. This app is designed to help you build real Japanese fluency through spaced repetition — a proven method that shows you words right before you're about to forget them, so they stick with as little effort as possible.")
                }

                // How the app is structured
                InfoCard(title: "What's in the app", icon: "square.grid.2x2") {
                    VStack(alignment: .leading, spacing: 10) {
                        SectionExplainer(icon: "book", title: "Dictionary", description: "Browse all vocabulary across every level. Use the filters to see words that are new, due for review, or already known.")
                        SectionExplainer(icon: "rectangle.stack", title: "Vocab", description: "Study vocabulary organised by JLPT level from N5 (beginner) to N1 (advanced), plus an Extras deck. Each level has Browse and Review modes.")
                        SectionExplainer(icon: "character.ja", title: "Kana", description: "Learn and drill hiragana and katakana — the two Japanese scripts you need before anything else. Start here if you're new to Japanese.")
                        SectionExplainer(icon: "text.book.closed", title: "Grammar", description: "Browse grammar patterns organised by category. Each entry has an explanation in English and Japanese, plus example sentences.")
                        SectionExplainer(icon: "bubble.left.and.bubble.right", title: "Translations", description: "Practice translating sentences with AI feedback. You'll need an OpenAI API key — see Settings for setup instructions.")
                    }
                }

                // How review works
                InfoCard(title: "How review works", icon: "arrow.clockwise") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("When you review a deck, cards are shown one at a time. Each card has two directions — Japanese to English, and English to Japanese.")
                            .fixedSize(horizontal: false, vertical: true)
                        Text("Read the front of the card, think of your answer, then tap Reveal. After seeing the answer, rate how well you knew it using the buttons at the bottom.")
                            .fixedSize(horizontal: false, vertical: true)
                        Text("Your rating tells the app when to show you that card again. Nail it and you won't see it for days. Struggle and it comes back within the hour.")
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }

                // The rating buttons
                InfoCard(title: "Rating buttons", icon: "hand.thumbsup") {
                    VStack(spacing: 12) {
                        RatingExplainer(
                            japanese: "もう一度",
                            english: "Again",
                            color: .red,
                            description: "You had no idea — you've never seen it or had no recollection at all. The card comes back shortly."
                        )
                        RatingExplainer(
                            japanese: "難しい",
                            english: "Difficult",
                            color: .orange,
                            description: "Seeing the answer, you thought 'oh yes' — but you didn't actually know it before revealing. You recognised it but couldn't recall it."
                        )
                        RatingExplainer(
                            japanese: "惜しい",
                            english: "Okay",
                            color: .yellow,
                            description: "You knew part of it — maybe one meaning or one reading — but weren't fully sure. Close but not quite."
                        )
                        RatingExplainer(
                            japanese: "良い",
                            english: "Good",
                            color: .blue,
                            description: "You remembered the word, but not everything — perhaps the kana reading but not the kanji, or a small detail was off."
                        )
                        RatingExplainer(
                            japanese: "簡単",
                            english: "Easy",
                            color: .green,
                            description: "You knew it instantly and completely — both the meaning and the kanji. No hesitation."
                        )
                    }
                }

                // Where to start
                InfoCard(title: "Where to start", icon: "flag") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("If you're new to Japanese, go to Kana first and learn hiragana and katakana before anything else.")
                            .fixedSize(horizontal: false, vertical: true)
                        Text("If you already know the scripts, head to Vocab and pick your level. N5 is the most beginner-friendly. If you're not sure, start there — you can always move up.")
                            .fixedSize(horizontal: false, vertical: true)
                        Text("Don't try to do everything at once. A short daily review session is far more effective than a long occasional one.")
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Supporting Views

struct InfoCard<Content: View>: View {
    let title: String
    let icon: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                Text(title)
                    .font(.headline)
            }
            content
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding()
        .background(.regularMaterial)
        .cornerRadius(12)
    }
}

struct SectionExplainer: View {
    let icon: String
    let title: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.secondary)
                .frame(width: 20)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct RatingExplainer: View {
    let japanese: String
    let english: String
    let color: Color
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(spacing: 2) {
                Text(japanese)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(color)
                Text(english)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .frame(width: 60)

            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)

            Spacer()
        }
    }
}
