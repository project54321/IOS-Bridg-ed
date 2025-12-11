//
//  FlashcardSetView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//


import SwiftUI

struct FlashcardSetView: View {
    @EnvironmentObject var store: FlashcardStore
    var set: FlashcardSet
    
    @State private var showingAddCard = false
    @State private var showingStudy = false

    var body: some View {
        List {
            ForEach(set.cards) { card in
                NavigationLink(destination: FlashcardView(card: card)) {
                    Text(card.question)
                        .lineLimit(1)
                }
            }
        }
        .navigationTitle(set.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Study") {
                    showingStudy = true
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingAddCard = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddCard) {
            AddFlashcardView(set: set)
        }
        .sheet(isPresented: $showingStudy) {
            StudyView(cards: set.cards)
        }
    }
}
