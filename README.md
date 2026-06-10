# Edutainment

![Swift](https://img.shields.io/badge/Swift-5.0+-FA7343?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-18.0+-000000?logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-16.0+-147EFB?logo=xcode&logoColor=white)
![Framework](https://img.shields.io/badge/Framework-SwiftUI-007AFF)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-8A2BE2)

An interactive and visually engaging multiplication practice game built natively with SwiftUI. 

Designed to make learning math fun, the app allows users to customize their practice tables and question counts, featuring fluid animations, custom card-based layouts, and a rewarding confetti celebration upon completion.

## Preview
<img width="20%" alt="Settings" src="https://github.com/user-attachments/assets/3b13898c-9c28-443b-b254-9ca1d2eae5b8" />
<img width="20%" alt="Game2" src="https://github.com/user-attachments/assets/238e4c80-0ecc-4b4c-a48a-c8aa8e36db94" />
<img width="20%" alt="Game" src="https://github.com/user-attachments/assets/04be8df6-26de-4b9a-97dd-0ef8984e07e1" />
<img width="20%" height="2796" alt="GameOver" src="https://github.com/user-attachments/assets/69a90b78-ef3c-4f63-9aff-a5ad53c2b5a9" />

## Features

* **Customizable Practice:** Select specific multiplication tables (up to 12) and configure the number of questions (5, 10, or 20) per round using custom stepper controls.
* **Fluid Gameplay:** Dynamic math challenges with instant, animated popup feedback (Awesome! / Oops!) powered by asymmetric scale and opacity transitions.
* **Modern UI Design:** Clean, distraction-free interface featuring custom soft shadows, pastel linear gradients, and heavily rounded system typography.
* **Rewarding Interactions:** A celebratory game-over screen complete with an interactive, non-blocking confetti particle cannon overlay.

## About the Project & Challenge

This application was built to fulfill the **Milestone Challenge (Day 35)** of the SwiftUI learning path created by Paul Hudson (Hacking with Swift). 

Beyond the core requirements, the entire codebase was meticulously refactored from a standard procedural layout into a highly scalable, modern iOS architecture. Key concepts practiced and implemented include:

* **Strict View Composition (Dumb & Smart Views):** Eradicated "Massive View" syndrome by breaking down complex screens into isolated, stateless atomic components (e.g., `TableSelectorView`, `GameHeaderView`, `PrimaryButton`). This significantly optimized the SwiftUI rendering tree.
* **MVVM & State Encapsulation:** Decoupled game logic from the UI using `ObservableObject`. Applied strict `private(set)` access modifiers to protect arrays and score integers from unintended view-layer mutations.
* **Declarative Screen Routing:** Replaced traditional navigation links with a state-driven layout, utilizing a `GameState` enum to seamlessly transition between Settings, Playing, and Game Over phases.
* **Advanced ZStack Layouts & Hit Testing:** Mastered the difference between global screen positioning and local overlay boundaries. Utilized `Color.clear.allowsHitTesting(false)` to safely render full-screen particle effects without hijacking interactive UI gestures.
* **Custom Modifiers (DRY Principle):** Created a reusable `.whiteCardStyle()` ViewModifier to enforce visual consistency and clean up repetitive layout code across different screens.

🔗 **[Full challenge description here](https://www.hackingwithswift.com/100/swiftui/35)**

## Project Versioning & Changelog

The development process was executed in two distinct iterations to demonstrate evolutionary refactoring practices. The repository is explicitly tagged as follows:

* **v1.0.0 (Functional MVP)** — `commit: bb0b11b`
    Core logic implementation. Contains the initial MVVM structure, state machine setup (`GameState`), multiplication data verification engine, and end-of-game round progression.

 <img width="25%" alt="ver 1" src="https://github.com/user-attachments/assets/a17bcf71-6f67-4255-9f28-226083e65ed9" />

* **v2.0.0 (UI Overhaul & Componentization)** — `commit: d015293`
    Production-ready update. Features a complete card-based design implementation, custom animation/feedback system, strict subview composition (`Dumb Views` architecture), and code deduplication (DRY) via atomic UI abstractions.
