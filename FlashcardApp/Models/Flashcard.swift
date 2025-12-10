//
//  Flashcard.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import Foundation

struct Flashcard: Identifiable, Codable {
    var id: UUID
    var question: String
    var answer: String
    
    init(id: UUID = UUID(), question: String, answer: String) {
        self.id = id
        self.question = question
        self.answer = answer
    }
}
