//
//  GameViewModel .swift
//  Edutainment
//
//  Created by murad on 25.05.2026.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var targetTable = 2
    @Published var questionCount = 5
    
    @Published var gameState: GameState = .settings
    @Published private(set) var questions: [Question] = []
    @Published private(set) var currentQuestionIndex = 0
    @Published private(set) var score = 0
    
    let questionOptions = [5, 10, 20]
    
    func generateQuestions() {
        questions.removeAll()
        
        for _ in 0..<questionCount {
            let num1 = Int.random(in: 2...targetTable)
            let num2 = Int.random(in: 1...12)
            
            let question = Question(factor1: num1, factor2: num2)
            questions.append(question)
        }
        
        currentQuestionIndex = 0
        score = 0
        gameState = .playing
    }
}
