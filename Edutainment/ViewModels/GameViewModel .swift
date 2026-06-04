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
    
    let questionOptions = [5, 10, 20]
    
    func generateQuestions() {
        questions = (0..<questionCount).map { _ in
            let num1 = Int.random(in: 2...targetTable)
            let num2 = Int.random(in: 1...12)
            
            return Question(factor1: num1, factor2: num2)
        }
        
        currentQuestionIndex = 0
        score = 0
        
        withAnimation {
            gameState = .playing
        }
    }
    
    func checkAnswer(_ input: String) {
        guard let number = Int(input) else { return }
        
        if questions[currentQuestionIndex].answer == number {
            score += 1
        }
    
        if currentQuestionIndex == questionCount - 1 {
            withAnimation {
                gameState = .gameOver
            }
        } else {
            currentQuestionIndex += 1
        }
    }
    
    func restartGame() {
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
