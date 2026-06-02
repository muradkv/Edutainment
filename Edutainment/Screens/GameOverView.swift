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
        VStack {
            Spacer()
            
            Text("🥳")
                .font(.system(size: 100))
                .padding(.bottom, 10)
            
            Text("Well Done!")
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundStyle(.green)
            
            Text("You scored \(viewModel.score) out of \(viewModel.questionCount)")
                .font(.title2.weight(.semibold))
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Button("Play Again") {
                viewModel.gameState = .settings
            }
            .font(.title2.bold())
            .frame(maxWidth: .infinity)
            .padding(.vertical, 17)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
        }
        .padding(30)
    }
}

#Preview {
    let previewModel = GameViewModel()
    previewModel.generateQuestions()
    
    return GameOverView(viewModel: previewModel)
}
