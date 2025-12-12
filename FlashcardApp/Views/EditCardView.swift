//
//  EditCardView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/11/25.
//


import SwiftUI

struct EditCardView: View {
    @Binding var set: FlashcardSet
    var card: Flashcard
    @Environment(\.dismiss) var dismiss

    @State private var question: String
    @State private var answer: String

    init(set: Binding<FlashcardSet>, card: Flashcard) {
        _set = set
        self.card = card
        _question = State(initialValue: card.question)
        _answer = State(initialValue: card.answer)
    }

    var body: some View {
        NavigationView {
            Form {
                Section("Question") { TextField("Edit question", text: $question) }
                Section("Answer") { TextField("Edit answer", text: $answer) }
            }
            .navigationTitle("Edit Card")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let i = set.cards.firstIndex(where: { $0.id == card.id }) {
                            set.cards[i].question = question
                            set.cards[i].answer = answer
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
