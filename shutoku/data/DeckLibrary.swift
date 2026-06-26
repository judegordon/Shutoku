import Foundation

enum DeckLibrary {

    static let allDecks: [Deck] = [

        Deck(
            id: "all",
            title: "All",
            fileNames: ["n1", "n2", "n3", "n4", "n5", "extras"]
        ),

        Deck(
            id: "n5",
            title: "N5",
            fileNames: ["n5"]
        ),

        Deck(
            id: "n4",
            title: "N4",
            fileNames: ["n4"]
        ),

        Deck(
            id: "n3",
            title: "N3",
            fileNames: ["n3"]
        ),

        Deck(
            id: "n2",
            title: "N2",
            fileNames: ["n2"]
        ),

        Deck(
            id: "n1",
            title: "N1",
            fileNames: ["n1"]
        ),

        Deck(
            id: "extras",
            title: "Extras",
            fileNames: ["extras"]
        )
    ]
}
