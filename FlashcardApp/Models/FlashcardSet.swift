//
//  FlashcardSet.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import Foundation

struct FlashcardSet: Identifiable, Codable {
    var id: UUID
    var name: String
    var cards: [Flashcard]

    init(id: UUID = UUID(), name: String, cards: [Flashcard] = []) {
        self.id = id
        self.name = name
        self.cards = cards
    }
}
