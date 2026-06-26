import SwiftUI

struct SettingsView: View {
    @State private var resetConfirmed: Bool = false
    @State private var limits: [String: Int] = [:]

    private var vocabDecks: [Deck] {
        DeckLibrary.allDecks.filter { $0.id != "all" }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                PageHeader(japanese: "設定", english: "SETTINGS")

                VStack(alignment: .leading, spacing: 12) {
                    Text("New Cards Per Day")
                        .font(.headline)

                    Text("Set how many new cards you want to see per day for each deck. Due reviews are always shown on top of this.")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    ForEach(vocabDecks) { deck in
                        HStack {
                            Text(deck.title)
                                .font(.subheadline)
                                .fontWeight(.semibold)

                            Spacer()

                            HStack(spacing: 12) {
                                Button {
                                    let current = limits[deck.id] ?? DailyLimitManager.limit(for: deck.id)
                                    let newValue = max(0, current - 5)
                                    limits[deck.id] = newValue
                                    DailyLimitManager.setLimit(newValue, for: deck.id)
                                } label: {
                                    Image(systemName: "minus.circle")
                                        .font(.title3)
                                }
                                .buttonStyle(.plain)

                                Text("\(limits[deck.id] ?? DailyLimitManager.limit(for: deck.id))")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .frame(width: 36, alignment: .center)

                                Button {
                                    let current = limits[deck.id] ?? DailyLimitManager.limit(for: deck.id)
                                    let newValue = min(200, current + 5)
                                    limits[deck.id] = newValue
                                    DailyLimitManager.setLimit(newValue, for: deck.id)
                                } label: {
                                    Image(systemName: "plus.circle")
                                        .font(.title3)
                                }
                                .buttonStyle(.plain)
                            }
                            .foregroundColor(.blue)
                        }
                        .padding(.vertical, 4)

                        if deck.id != vocabDecks.last?.id {
                            Divider()
                        }
                    }
                }
                .padding()
                .background(.regularMaterial)
                .cornerRadius(12)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Data")
                        .font(.headline)

                    Text("Reset all review progress. This cannot be undone.")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Button(role: .destructive) {
                        // Clear review states file
                        let documents = FileManager.default.urls(
                            for: .documentDirectory,
                            in: .userDomainMask
                        )[0]
                        let url = documents.appendingPathComponent("reviewStates.json")
                        try? FileManager.default.removeItem(at: url)

                        // Clear StorageManager cache
                        StorageManager.clearCache()

                        // Clear all session and daily limit UserDefaults keys
                        let defaults = UserDefaults.standard
                        let allKeys = defaults.dictionaryRepresentation().keys
                        for key in allKeys {
                            if key.hasPrefix("sessionCardIDs_") ||
                               key.hasPrefix("sessionIndex_") ||
                               key.hasPrefix("shownToday_") ||
                               key.hasPrefix("completed_") ||
                               key.hasPrefix("streak_") ||
                               key == "hasCompletedStorageMigration" {
                                defaults.removeObject(forKey: key)
                            }
                        }

                        // Reinitialise fresh states
                        for deck in DeckLibrary.allDecks where deck.id != "all" {
                            let entries = DataLoader.loadEntries(from: deck)
                            StorageManager.initializeReviewStatesIfNeeded(entries: entries)
                        }

                        resetConfirmed = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            resetConfirmed = false
                        }
                    } label: {
                        Text(resetConfirmed ? "Reset Complete ✓" : "Reset All Progress")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                .padding()
                .background(.regularMaterial)
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            for deck in vocabDecks {
                limits[deck.id] = DailyLimitManager.limit(for: deck.id)
            }
        }
    }
}

struct StepNote: View {
    let number: String
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text(number)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 18, height: 18)
                .background(Color.blue)
                .clipShape(Circle())
            Text(text)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}
