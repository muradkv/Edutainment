//
//  CircleActionButton.swift
//  Edutainment
//
//  Created by murad on 09.06.2026.
//

import SwiftUI

struct CircleActionButton: View {
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: iconName)
                .font(.title2)
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.2))
                .foregroundColor(.primary)
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircleActionButton(iconName: "chevron.left") { } 
}
