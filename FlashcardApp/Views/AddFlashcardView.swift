//
//  AddFlashcardView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import SwiftUI

struct AddFlashcardView: View {
    @EnvironmentObject var store: FlashcardStore
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
            .navigationTitle("Add Flashcard")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        guard !question.isEmpty, !answer.isEmpty else { return }
                        store.addCard(question: question, answer: answer)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

