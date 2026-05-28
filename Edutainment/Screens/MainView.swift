//
//  ContentView.swift
//  Edutainment
//
//  Created by murad on 24.05.2026.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        Group {
            switch viewModel.gameState {
            case .settings:
                SettingsView(viewModel: viewModel)
            case .playing:
                GameView(viewModel: viewModel)
            case .gameOver:
                GameOverView()
            }
        }
    }
}

#Preview {
    MainView()
}
