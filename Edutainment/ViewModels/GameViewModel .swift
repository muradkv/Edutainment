//
//  GameViewModel .swift
//  Edutainment
//
//  Created by murad on 25.05.2026.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published private(set) var targetTable = 2
    @Published var questionCount = 5
    
    @Published private(set) var gameState: GameState = .settings
    @Published private(set) var questions: [Question] = []
    @Published private(set) var currentQuestionIndex = 0
    @Published private(set) var score = 0
    
    @Published var feedbackTitle: String = ""
    @Published var showFeedback: Bool = false
    @Published var isAnswerCorrect: Bool = false
    
    let questionOptions = [5, 10, 20]
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    var gameOverTitle: String {
        if score == questionCount {
            return "Perfect!"
        } else if score >= questionCount / 2 {
            return "Good Job!"
        } else {
            return "Keep Practicing!"
        }
    }
    
    var gameOverEmoji: String {
        if score == questionCount {
            return "🏆"
        } else if score >= questionCount / 2 {
            return "🌟"
        } else {
            return "💪"
        }
    }
    
    func startGame() {
        questions = makeQuestions()
        
        currentQuestionIndex = 0
        score = 0
        
        withAnimation {
            gameState = .playing
        }
    }
    
    func checkAnswer(_ input: String) {
        let correctAnswer = currentQuestion.answer
        let isCorrect = Int(input) == correctAnswer
        
        if isCorrect {
            score += 1
            feedbackTitle = "Awesome! 🌟"
            isAnswerCorrect = true
        } else {
            feedbackTitle = "Oops! 🙈"
            isAnswerCorrect = false
        }
        
        withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0)) {
            showFeedback = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeOut(duration: 0.3)) {
                self.showFeedback = false
            }
            
            if self.currentQuestionIndex == self.questionCount - 1 {
                withAnimation {
                    self.gameState = .gameOver
                }
            } else {
                self.currentQuestionIndex += 1
            }
        }
    }
    
    private func makeQuestions() -> [Question] {
        (0..<questionCount).map { _ in
            let num1 = Int.random(in: 2...targetTable)
            let num2 = Int.random(in: 1...12)
            
            return Question(factor1: num1, factor2: num2)
        }
    }
    
    func showSettings() {
        withAnimation {
            gameState = .settings
        }
    }
    
    func decrementTable() {
        targetTable = max(2, targetTable - 1)
    }
    
    func incrementTable() {
        targetTable = min(12, targetTable + 1)
    }
}
