//
//  ExtractedView.swift
//  Edutainment
//
//  Created by murad on 09.06.2026.
//

import SwiftUI

struct SettingsHeaderView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Math tables")
                .font(.system(size: 36, weight: .heavy, design: .rounded))
            
            Text("Set up your game")
                .font(.system(size: 18, weight: .light, design: .rounded))
                .foregroundColor(.gray)
        }
    }
}
