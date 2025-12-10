//
//  ContentView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: FlashcardStore
    @State private var showingAdd = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.cards) { card in
                    NavigationLink(destination: FlashcardView(card: card)) {
                        Text(card.question)
                            .lineLimit(1)
                    }
                }
            }
            .navigationTitle("Flashcards")
            .toolbar {
                Button(action: { showingAdd = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAdd) {
                AddFlashcardView()
            }
        }
    }
}
