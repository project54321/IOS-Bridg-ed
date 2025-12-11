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
                ForEach(store.sets) { set in
                    NavigationLink(destination: FlashcardSetView(set: set)) {
                        Text(set.name)
                    }
                }
            }
            .navigationTitle("Flashcard Sets")
            .toolbar {
                Button(action: { showingAddSet = true }) {
                    Image(systemName: "folder.badge.plus")
                }
            }
            .sheet(isPresented: $showingAddSet) {
                AddSetView()
            }
        }
    }
}
