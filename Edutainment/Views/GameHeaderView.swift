//
//  GameHeaderView.swift
//  Edutainment
//
//  Created by murad on 10.06.2026.
//

import SwiftUI

struct GameHeaderView: View {
    let currentIndex: Int
    let totalQuestions: Int
    let score: Int
    
    var body: some View {
        HStack {
            Text(
                "Question \(currentIndex + 1) / \(totalQuestions)"
            )
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(.gray)
            
            Spacer()
            
            Text("Score: \(score)")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
