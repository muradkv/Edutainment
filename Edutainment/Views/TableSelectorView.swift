//
//  TableSelectorView.swift
//  Edutainment
//
//  Created by murad on 09.06.2026.
//

import SwiftUI

struct TableSelectorView: View {
    let currentTabel: Int
    let onDecrement: () -> Void
    let onIncrement: () -> Void
    
    var body: some View {
        HStack(spacing: 25) {
            
            CircleActionButton(iconName: "chevron.left") {
                onDecrement()
            }
            
            Text("\(currentTabel)")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
                .background(
                    LinearGradient(
                        colors: [Color.cyan.opacity(1), Color.purple.opacity(1)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .clipShape(Circle())
            
            CircleActionButton(iconName: "chevron.right") {
                onIncrement()
            }
        }
    }
}
