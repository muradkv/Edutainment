//
//  GameView.swift
//  Edutainment
//
//  Created by murad on 26.05.2026.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    @State private var answerInput = ""
    
    var body: some View {
        VStack {
            HStack {
                Text(
                    "Question \(viewModel.currentQuestionIndex + 1) / \(viewModel.questionCount)"
                )
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                
                Spacer()
                
                Text("Score: \(viewModel.score)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            .padding()
            
            VStack(spacing: 40) {
                
                VStack(spacing: 10) {
                    Text("What is")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.top)
                    
                    Text(viewModel.currentQuestion.text)
                        .font(.system(size: 80, weight: .black, design: .rounded))
                        .foregroundColor(.black)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                }
                
                TextField("?", text: $answerInput)
                    .keyboardType(.numberPad)
                    .font(.system(size: 50, weight: .heavy, design: .rounded))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, minHeight: 80)
                    .background(.white)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 0)
                
                Button("Submit") {
                    viewModel.checkAnswer(answerInput)
                    answerInput = ""
                }
                .font(.system(.title3, design: .rounded).bold())
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.cyan)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .disabled(answerInput.isEmpty)
            }
        }
        .frame(maxWidth: .infinity)
        .whiteCardStyle()
        .overlay(alignment: .top) {
            if viewModel.showFeedback {
                Text(viewModel.feedbackTitle)
                    .font(.system(size: 50, weight: .black, design: .rounded))
                    .foregroundColor(viewModel.isAnswerCorrect ? .green : .red)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .transition(.asymmetric(
                        insertion: .scale.combined(with: .opacity),
                        removal: .opacity
                    ))
                    .zIndex(1)
                    .offset(y: -100)
            }
        }
    }
}

#Preview {
    let previewModel = GameViewModel()
    previewModel.generateQuestions()
    
    return ZStack {
        AppBackgroundView()
        GameView(viewModel: previewModel)
    }
}
