import Foundation

final class DataLoader {

    static func loadEntries(
        from deck: Deck
    ) -> [Entry] {

        var allEntries: [Entry] = []

        for fileName in deck.fileNames {
            guard let url = Bundle.main.url(
                forResource: fileName,
                withExtension: "json"
            ) else {

                print(
                    "Could not find \(fileName).json"
                )

                continue
            }

            do {

                let data = try Data(contentsOf: url)

                let entries = try JSONDecoder().decode(
                    [Entry].self,
                    from: data
                )

                allEntries.append(
                    contentsOf: entries
                )

            } catch {
                
                print(
                    """
                    Failed to decode \(fileName).json:
                    \(error)
                    """
                )

                continue
            }
        }

        return allEntries
    }
}
