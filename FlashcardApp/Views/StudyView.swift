//
//  StudyView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import SwiftUI

struct StudyView: View {
    var cards: [Flashcard]

    @State private var index = 0
    @State private var flipped = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Spacer()

            if cards.isEmpty {
                Text("No cards in this set yet!")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button("Go Back") {
                    dismiss()
                }
                .padding()
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue.opacity(0.3))
                    .frame(height: 250)
                    .overlay(
                        Text(flipped ? cards[index].answer : cards[index].question)
                            .font(.title2)
                            .padding()
                    )
                    .onTapGesture {
                        withAnimation { flipped.toggle() }
                    }

                Spacer()

                HStack {
                    Button("Back") {
                        if index > 0 {
                            index -= 1
                            flipped = false
                        }
                    }
                    Spacer()
                    Button("Next") {
                        if index < cards.count - 1 {
                            index += 1
                            flipped = false
                        }
                    }
                }
                .padding()
            }

            Spacer()
        }
        .padding()
    }
}

