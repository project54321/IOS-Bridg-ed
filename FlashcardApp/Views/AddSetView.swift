//
//  AddSetView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import SwiftUI

struct AddSetView: View {
    @EnvironmentObject var store: FlashcardStore
    @Environment(\.dismiss) var dismiss

    @State private var name = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Set name", text: $name)
            }
            .navigationTitle("New Set")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        guard !name.isEmpty else { return }
                        store.addSet(name: name)
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
