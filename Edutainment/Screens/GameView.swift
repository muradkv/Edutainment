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
        VStack(spacing: 30) {
            Text("Question \(viewModel.currentQuestionIndex + 1) of \(viewModel.questionCount)")
                .font(.headline)
                .foregroundStyle(.secondary)
            
            Text("Score: \(viewModel.score)")
                .font(.title3.bold())
            
            Spacer()
            
            let currentQuestion = viewModel.questions[viewModel.currentQuestionIndex]
            
            Text("What is")
                .font(.title2)
            
            Text(currentQuestion.text)
                .font(.system(size: 60, weight: .black, design: .rounded))
            
            TextField("Answer", text: $answerInput)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 150)
            
            Button("Submit") {
                viewModel.checkAnswer(answerInput)
                answerInput = ""
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .disabled(answerInput.isEmpty)
            
            Spacer()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    let previewModel = GameViewModel()
    previewModel.generateQuestions()
    
    return GameView(viewModel: previewModel)
}
