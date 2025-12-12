//
//  ContentView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: FlashcardStore
    @State private var showingAddSet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(store.sets.indices, id: \.self) { index in
                    NavigationLink(destination: FlashcardSetView(set: $store.sets[index])) {
                        let set = store.sets[index]
                        VStack(alignment: .leading, spacing: 4) {
                            Text(set.name)
                                .font(.headline)
                            Text("\(set.cards.count) cards")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 6)
                    }
                }
                .onDelete(perform: deleteSet)
            }
            .navigationTitle("Flashcard Sets")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddSet = true
                    } label: {
                        Image(systemName: "folder.badge.plus")
                            .font(.title3)
                    }
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddSet) {
                AddSetView()
            }
        }
    }

    private func deleteSet(at offsets: IndexSet) {
        store.sets.remove(atOffsets: offsets)
    }
}
