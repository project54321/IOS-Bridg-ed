//
//  AddCardToSetView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/11/25.
//


import SwiftUI

struct AddCardToSetView: View {
    @EnvironmentObject var store: FlashcardStore
    @Environment(\.dismiss) var dismiss

    var set: FlashcardSet

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
            .navigationTitle("Add Card")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        guard !question.isEmpty, !answer.isEmpty else { return }
                        store.addCard(to: set, question: question, answer: answer)
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
