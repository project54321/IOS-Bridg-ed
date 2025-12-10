//
//  FlashcardStore.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import Foundation
import Combine

class FlashcardStore: ObservableObject {
    @Published var cards: [Flashcard] = [] {
        didSet {
            saveCards()
        }
    }
    
    init() {
        loadCards()
    }
    
    func addCard(question: String, answer: String) {
        let newCard = Flashcard(question: question, answer: answer)
        cards.append(newCard)
    }
    
    private func saveCards() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "flashcards")
        }
    }
    
    private func loadCards() {
        if let data = UserDefaults.standard.data(forKey: "flashcards"),
           let savedCards = try? JSONDecoder().decode([Flashcard].self, from: data) {
            cards = savedCards
        }
    }
}
