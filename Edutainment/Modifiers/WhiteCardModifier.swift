//
//  WhiteCardModifier.swift
//  Edutainment
//
//  Created by murad on 05.06.2026.
//

import SwiftUI

struct WhiteCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(30)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
            .padding(.horizontal, 20)
    }
}

extension View {
    func whiteCardStyle() -> some View {
        modifier(WhiteCardModifier())
    }
}
