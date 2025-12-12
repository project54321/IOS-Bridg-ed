//
//  EditCardInStudyView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/11/25.
//


import SwiftUI

struct EditCardInStudyView: View {
    @Binding var cards: [Flashcard]
    var card: Flashcard
    @Environment(\.dismiss) var dismiss

    @State private var question: String
    @State private var answer: String

    init(cards: Binding<[Flashcard]>, card: Flashcard) {
        _cards = cards
        self.card = card
        _question = State(initialValue: card.question)
        _answer = State(initialValue: card.answer)
    }

    var body: some View {
        NavigationView {
            Form {
                Section("Question") { TextField("Question", text: $question) }
                Section("Answer") { TextField("Answer", text: $answer) }
            }
            .navigationTitle("Edit Card")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let i = cards.firstIndex(where: { $0.id == card.id }) {
                            cards[i].question = question
                            cards[i].answer = answer
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}
