//
//  StudyView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import SwiftUI

struct StudyView: View {
    @Binding var cards: [Flashcard]
    @State private var index = 0
    @State private var flipped = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if cards.isEmpty {
                    VStack(spacing: 12) {
                        Text("No cards in this set")
                            .font(.title3)
                            .foregroundColor(.secondary)
                        Button("Done") { dismiss() }
                    }
                    .padding()
                } else {
                    Text("Card \(index + 1) of \(cards.count)")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue.opacity(0.7)) // You can change the color here
                            .frame(height: 320)
                            .shadow(radius: 6)

                        Text(flipped ? cards[index].answer : cards[index].question)
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                    }
                    .onTapGesture {
                        withAnimation(.spring()) { flipped.toggle() }
                    }

                    HStack(spacing: 30) {
                        Button(action: back) {
                            Image(systemName: "chevron.left.circle.fill")
                                .font(.system(size: 44))
                                .foregroundColor(index == 0 ? .gray : .white)
                        }
                        Spacer()
                        Button(action: next) {
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.system(size: 44))
                                .foregroundColor(index == cards.count - 1 ? .gray : .white)
                        }
                    }
                    .padding(.top, 12)

                    Spacer()

                    Button("Done") { dismiss() }
                        .font(.headline)
                        .padding(.top, 6)
                }
            }
            .padding()
            .navigationTitle("Study")
        }
    }

    private func next() {
        if index < cards.count - 1 { index += 1; flipped = false }
    }

    private func back() {
        if index > 0 { index -= 1; flipped = false }
    }
}
