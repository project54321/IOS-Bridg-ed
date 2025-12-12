//
//  FlashcardSetView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import SwiftUI

struct FlashcardSetView: View {
    @EnvironmentObject var store: FlashcardStore
    @Binding var set: FlashcardSet

    @State private var showingAddCard = false
    @State private var editingCard: Flashcard? = nil
    @State private var showingStudy = false

    var body: some View {
        VStack {
            if set.cards.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "doc.text.magnifyingglass")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                    Text("No cards in this set yet.")
                        .foregroundColor(.gray)
                }
                .padding(.top, 50)
            }

            List {
                ForEach(set.cards) { card in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(card.question)
                                .font(.headline)
                            Text(card.answer)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Button {
                            editingCard = card
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                        .buttonStyle(.borderless)
                        
                        Button {
                            if let index = set.cards.firstIndex(where: { $0.id == card.id }) {
                                set.cards.remove(at: index)
                            }
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(.borderless)
                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .navigationTitle(set.name)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("Study") { showingStudy = true }
                Button { showingAddCard = true } label: {
                    Image(systemName: "plus")
                }
            }
        }
        // Sheets
        .sheet(isPresented: $showingAddCard) {
            AddCardView(set: $set)
        }
        .sheet(item: $editingCard) { card in
            EditCardView(set: $set, card: card)
        }
        .sheet(isPresented: $showingStudy) {
            StudyView(cards: $set.cards)
        }
    }
}
