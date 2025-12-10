//
//  FlashcardView.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import SwiftUI

struct FlashcardView: View {
    var card: Flashcard
    @State private var flipped = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue.opacity(0.3))
                .frame(height: 250)
            
            Text(flipped ? card.answer : card.question)
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
        }
        .padding()
        .onTapGesture {
            withAnimation {
                flipped.toggle()
            }
        }
    }
}
