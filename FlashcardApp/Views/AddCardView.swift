//
//  AddCardView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/11/25.
//


//
//  AddCardView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/11/25.
//


import SwiftUI

struct AddCardView: View {
    @Binding var set: FlashcardSet
    @Environment(\.dismiss) var dismiss

    @State private var question = ""
    @State private var answer = ""

    var body: some View {
        NavigationView {
            Form {
                Section("Question") {
                    TextField("Enter question", text: $question)
                }
                Section("Answer") {
                    TextField("Enter answer", text: $answer)
                }
            }
            .navigationTitle("New Card")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        guard !question.trimmingCharacters(in: .whitespaces).isEmpty,
                              !answer.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                        set.cards.append(Flashcard(question: question, answer: answer))
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
