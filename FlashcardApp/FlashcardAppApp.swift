//
//  FlashcardAppApp.swift
//  FlashcardApp
//
//  Created by Arjun Averineni on 12/10/25.
//

import SwiftUI

@main
struct FlashcardAppApp: App {
    @StateObject var store = FlashcardStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}

