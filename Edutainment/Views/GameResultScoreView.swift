//
//  GameResultScoreView.swift
//  Edutainment
//
//  Created by murad on 10.06.2026.
//

import SwiftUI

struct GameResultScoreView: View {
    let score: Int
    let totalQuestions: Int
    
    var body: some View {
        Text("You scored \(score) out of \(totalQuestions)")
            .font(.system(.title2, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.gray)
    }
}
