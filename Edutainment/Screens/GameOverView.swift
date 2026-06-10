//
//  GameOverView.swift
//  Edutainment
//
//  Created by murad on 26.05.2026.
//

import SwiftUI
import ConfettiSwiftUI

struct GameOverView: View {
    @ObservedObject var viewModel: GameViewModel
    @State private var confettiCounter = 0
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Text(viewModel.gameOverEmoji)
                    .font(.system(size: 100))
                    .padding(.top)
                
                Text(viewModel.gameOverTitle)
                    .font(.system(.largeTitle, design: .rounded).bold())
                    .foregroundColor(.black)
                
                GameResultScoreView(
                    score: viewModel.score,
                    totalQuestions: viewModel.questionCount
                )
                
                PrimaryButton(title: "Play Again") {
                    viewModel.showSettings()
                }
            }
            .frame(maxWidth: .infinity)
            .whiteCardStyle()
            .padding()
            
            Color.clear
                .contentShape(Rectangle())
                .allowsHitTesting(false)
                .confettiCannon(
                    trigger: $confettiCounter,
                    num: 100,
                    confettis: [ConfettiType.text("🎉"), ConfettiType.text("🌟"), ConfettiType.shape(.circle)],
                    radius: 500
                )
        }
        .onAppear {
            if viewModel.score > 0 {
                confettiCounter += 1
            }
        }
    }
}

#Preview {
    let previewModel = GameViewModel()
    previewModel.startGame()
    
    return ZStack {
        AppBackgroundView()
        GameOverView(viewModel: previewModel)
    }
}
