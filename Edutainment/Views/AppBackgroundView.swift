//
//  AppBackgroundView.swift
//  Edutainment
//
//  Created by murad on 05.06.2026.
//

import SwiftUI

struct AppBackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [Color.cyan.opacity(0.3), Color.purple.opacity(0.3)],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    AppBackgroundView()
}
