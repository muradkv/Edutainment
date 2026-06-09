//
//  PrimaryButton.swift
//  Edutainment
//
//  Created by murad on 09.06.2026.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(.title3, design: .rounded).bold())
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.cyan)
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
}
