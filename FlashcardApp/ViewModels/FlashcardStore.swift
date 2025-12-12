//
//  FlashcardStore.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import Foundation
import Combine

class FlashcardStore: ObservableObject {
    @Published var sets: [FlashcardSet] = [] {
        didSet { saveSets() }
    }

    init() {
        loadSets()
    }

    func addSet(name: String) {
        sets.append(FlashcardSet(name: name))
    }

    func deleteSet(_ set: FlashcardSet) {
        sets.removeAll { $0.id == set.id }
    }


    func addCard(to set: FlashcardSet, question: String, answer: String) {
        guard let index = sets.firstIndex(where: { $0.id == set.id }) else { return }
        sets[index].cards.append(Flashcard(question: question, answer: answer))
    }

    func deleteCard(set: FlashcardSet, card: Flashcard) {
        guard let setIndex = sets.firstIndex(where: { $0.id == set.id }) else { return }
        sets[setIndex].cards.removeAll { $0.id == card.id }
    }

    func updateCard(set: FlashcardSet, card: Flashcard, newQuestion: String, newAnswer: String) {
        guard let setIndex = sets.firstIndex(where: { $0.id == set.id }) else { return }
        guard let cardIndex = sets[setIndex].cards.firstIndex(where: { $0.id == card.id }) else { return }

        sets[setIndex].cards[cardIndex].question = newQuestion
        sets[setIndex].cards[cardIndex].answer = newAnswer
    }

    // MARK: - Persistence
    private func saveSets() {
        if let data = try? JSONEncoder().encode(sets) {
            UserDefaults.standard.set(data, forKey: "flashcardSets")
        }
    }

    private func loadSets() {
        if let data = UserDefaults.standard.data(forKey: "flashcardSets"),
           let saved = try? JSONDecoder().decode([FlashcardSet].self, from: data) {
            sets = saved
        }
    }
}
