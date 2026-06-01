import Foundation

enum DeckLibrary {

    static let allDecks: [Deck] = [

        Deck(
            id: "n5",
            title: "N5",
            fileNames: [
                "n5_part1",
                "n5_part2",
                "n5_part3",
                "n5_part4"
            ]
        ),

        Deck(
            id: "n4",
            title: "N4",
            fileNames: [
                "n4_part1"
            ]
        ),

        Deck(
            id: "n3",
            title: "N3",
            fileNames: [
                "n3_part1"
            ]
        ),

        Deck(
            id: "n2",
            title: "N2",
            fileNames: [
                "n2_part1"
            ]
        ),

        Deck(
            id: "n1",
            title: "N1",
            fileNames: [
                "n1_part1"
            ]
        )
    ]
}
