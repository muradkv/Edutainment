//
//  FeedbackToastView.swift
//  Edutainment
//
//  Created by murad on 10.06.2026.
//

import SwiftUI

struct FeedbackToastView: View {
    let title: String
    let isCorrect: Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 50, weight: .black, design: .rounded))
            .foregroundColor(isCorrect ? .green : .red)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            .transition(.asymmetric(
                insertion: .scale.combined(with: .opacity),
                removal: .opacity
            ))
            .zIndex(1)
            .offset(y: -100)
    }
}
