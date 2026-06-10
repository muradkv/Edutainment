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
        ZStack  {
            
            VStack {
                HStack {
                    ExitButtonView {
                        viewModel.showSettings()
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            .padding()
            
            VStack {
                GameHeaderView(
                    currentIndex: viewModel.currentQuestionIndex,
                    totalQuestions: viewModel.questionCount,
                    score: viewModel.score
                )
                
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
                    
                    PrimaryButton(title: "Submit") {
                        viewModel.checkAnswer(answerInput)
                        answerInput = ""
                    }
                    .disabled(answerInput.isEmpty)
                }
            }
            .frame(maxWidth: .infinity)
            .whiteCardStyle()
            .overlay(alignment: .top) {
                if viewModel.showFeedback {
                    FeedbackToastView(
                        title: viewModel.feedbackTitle,
                        isCorrect: viewModel.isAnswerCorrect
                    )
                }
            }
        }
    }
}

#Preview {
    let previewModel = GameViewModel()
    previewModel.startGame()
    
    return ZStack {
        AppBackgroundView()
        GameView(viewModel: previewModel)
    }
}
