# Bridg-ED: Mobile Flashcard App

[Web Demo](https://bridg-ed.vercel.app) | [GitHub Repository](https://github.com/project54321/Bridg-ED)

---

## Overview

**Bridg-ED** is a mobile flashcard application inspired by my previous hackathon project. It allows users to create **custom flashcard sets**, add cards, study them interactively, and manage their learning efficiently. This iOS app is a mobile adaptation of the original web-based version, bringing your learning experience directly to your iPhone or iPad.

This app is designed to help learners organize study material, track their progress, and engage with flashcards in a **visually appealing and intuitive interface**.

---

## Features

- **Flashcard Sets**: Organize your cards into named sets for different subjects or topics.
- **Add, Edit, and Delete Cards**: Create new cards, edit existing ones, and remove cards from a set.
- **Study Mode**:
  - Flip cards by tapping.
  - Navigate between cards using Next/Back buttons.
  - View total number of cards in the session.
- **Persistent Storage**: Data is saved locally on the device using `UserDefaults`, ensuring flashcards and sets persist even after closing the app.
- **Modern UI**:
  - Gradient and rounded card designs.
  - Responsive layout for all screen sizes.
  - Clean and intuitive navigation.
- **Delete Flashcard Sets**: Manage multiple sets and remove any set as needed.

---

## Screenshots

*To Be Included Later*

---

## Installation & Setup

Follow these steps to run the project locally on your iOS device or simulator:

1. **Clone the repository**

```bash
git clone https://github.com/project54321/Bridg-ED.git
cd Bridg-ED
```

Open in Xcode

Open Bridg-ED.xcodeproj or Bridg-ED.xcworkspace in Xcode (latest recommended version).

**Set up Signing**
- Connect your iPhone/iPad or choose a simulator.
- Ensure your Apple ID is configured in Xcode under Preferences → Accounts.
- Go to Signing & Capabilities and select your development team.
- Build and Run
- Select your device/simulator in the top toolbar.
- Press Run (⌘R) to launch the app.

**You can now create sets, add cards, and start studying!**

⚠️ Note: This app is not published on the App Store. Users can run the project locally on their devices.

## Project Structure
FlashcardApp/
  ├── Models/
  │     └── Flashcard.swift
  ├── ViewModels/
  │     └── FlashcardStore.swift
  ├── Views/
  │     ├── ContentView.swift
  │     ├── FlashcardView.swift
  │     ├── AddCardView.swift
  │     ├── EditCardView.swift
  │     ├── FlashcardSetView.swift
  │     └── StudyView.swift
  ├── Assets/
  └── FlashcardAppApp.swift
Models: Data structures for flashcards and sets.

ViewModels: Handles the data layer and persistence.

Views: SwiftUI views for creating, editing, and studying flashcards.

Tech Stack
Language: Swift 5
Framework: SwiftUI
Storage: UserDefaults (local persistent storage)
Platform: iOS 17+

**Inspiration**
This app is a mobile adaptation of my hackathon project Bridg-ED, originally a web-based flashcard platform. It brings all the features of the web version to a native mobile experience, with offline capability and touch-friendly interactions.

**Contributing**
Feel free to fork this repository, create issues, or submit pull requests if you want to improve the app or add new features. Suggestions for design improvements, animations, or additional study modes are welcome!

**License**
MIT LISCENCSE - READ GUIDLINES

**Links**
Web Demo: bridg-ed.vercel.app
GitHub Repo: https://github.com/project54321/Bridg-ED
