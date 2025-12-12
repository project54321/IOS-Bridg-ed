//
//  SetDetailView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/11/25.
//


import SwiftUI

struct SetDetailView: View {
    @EnvironmentObject var store: FlashcardStore
    @Binding var set: FlashcardSet

    @State private var showingAddCard = false
    @State private var editingCard: Flashcard? = nil
    @State private var showingStudy = false

    var body: some View {
        VStack {
            if set.cards.isEmpty {
                VStack(spacing: 12) {
                    Text("No cards yet")
                        .foregroundColor(.secondary)
                    Button("Add Card") { showingAddCard = true }
                        .padding(.top, 4)
                }
                .padding(.top, 50)
            }

            List {
                ForEach(set.cards) { card in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(card.question)
                                .font(.headline)
                                .lineLimit(1)
                            Text(card.answer)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                        Spacer()
                        Button {
                            editingCard = card
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                        .buttonStyle(.borderless)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        // tap anywhere on the row to edit
                        editingCard = card
                    }
                }
                .onDelete { indexSet in
                    set.cards.remove(atOffsets: indexSet)
                }
            }
        }
        .navigationTitle(set.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Button {
                        showingStudy = true
                    } label: {
                        Text("Study")
                    }

                    Button {
                        showingAddCard = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        // MARK: - Sheets
        .sheet(isPresented: $showingAddCard) {
            AddCardView(set: $set) // ✅ binding passed correctly
        }
        .sheet(item: $editingCard) { card in
            EditCardView(set: $set, card: card) // ✅ binding passed correctly
        }
        .sheet(isPresented: $showingStudy) {
            StudyView(cards: $set.cards) // ✅ binding passed correctly
        }
    }
}
