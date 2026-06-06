//
//  ExitButtonView.swift
//  Edutainment
//
//  Created by murad on 06.06.2026.
//


import SwiftUI

struct ExitButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.gray)
                .padding(10)
                .background(Color.gray.opacity(0.15))
                .clipShape(Circle())
        }
    }
}