//
//  SectionTitleView.swift
//  Edutainment
//
//  Created by murad on 09.06.2026.
//

import SwiftUI

struct SectionTitleView: View {
    let title: String
    
    var body: some View {
        Text(title.uppercased())
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
