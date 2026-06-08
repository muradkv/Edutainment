//
//  GameOverView.swift
//  Edutainment
//
//  Created by murad on 26.05.2026.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text(viewModel.gameOverEmoji)
                .font(.system(size: 100))
                .padding(.top)
            
            Text(viewModel.gameOverTitle)
                .font(.system(.largeTitle, design: .rounded).bold())
                .foregroundColor(.black)
            
            Text("You scored \(viewModel.score) out of \(viewModel.questionCount)")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            Button("Play Again") {
                viewModel.showSettings()
            }
            .font(.system(.title3, design: .rounded).bold())
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.cyan)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
        .frame(maxWidth: .infinity)
        .whiteCardStyle()
        .padding()
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
