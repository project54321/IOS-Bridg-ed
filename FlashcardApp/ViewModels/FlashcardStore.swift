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
        didSet {
            save()
        }
    }

    init() {
        load()
    }

    // MARK: Set Functions
    func addSet(name: String) {
        sets.append(FlashcardSet(name: name))
    }

    // MARK: Card Functions
    func addCard(to set: FlashcardSet, question: String, answer: String) {
        if let index = sets.firstIndex(where: { $0.id == set.id }) {
            sets[index].cards.append(Flashcard(question: question, answer: answer))
        }
    }

    // MARK: Save/Load
    private func save() {
        if let data = try? JSONEncoder().encode(sets) {
            UserDefaults.standard.set(data, forKey: "flashcard_sets")
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: "flashcard_sets"),
           let savedSets = try? JSONDecoder().decode([FlashcardSet].self, from: data) {
            sets = savedSets
        }
    }
}
