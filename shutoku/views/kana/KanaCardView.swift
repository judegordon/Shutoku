import SwiftUI

struct KanaCardView: View {
    let card: KanaReviewCard
    let script: KanaScript
    let isFlipped: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(radius: 4)

            if isFlipped {
                backContent
            } else {
                frontContent
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 240)
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0.2), value: isFlipped)
    }

    private var frontContent: some View {
        VStack(spacing: 12) {
            if card.direction == .kanaToRomaji {
                Text(script == .hiragana ? card.entry.hiragana : card.entry.katakana)
                    .font(.system(size: 72, weight: .light))
            } else {
                Text(card.entry.romaji)
                    .font(.system(size: 48, weight: .light))
                Text("→ \(script == .hiragana ? "hiragana" : "katakana")")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }

    private var backContent: some View {
        VStack(spacing: 12) {
            if card.direction == .kanaToRomaji {
                Text(script == .hiragana ? card.entry.hiragana : card.entry.katakana)
                    .font(.system(size: 48, weight: .light))
                    .foregroundColor(.secondary)
                Text(card.entry.romaji)
                    .font(.system(size: 48, weight: .bold))
            } else {
                Text(card.entry.romaji)
                    .font(.system(size: 32, weight: .light))
                    .foregroundColor(.secondary)
                Text(script == .hiragana ? card.entry.hiragana : card.entry.katakana)
                    .font(.system(size: 72, weight: .bold))
            }

            Text(script == .hiragana ? "Hiragana: \(card.entry.hiragana)  Katakana: \(card.entry.katakana)" : "Katakana: \(card.entry.katakana)  Hiragana: \(card.entry.hiragana)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}
