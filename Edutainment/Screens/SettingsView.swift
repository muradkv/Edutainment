//
//  SettingsView.swift
//  Edutainment
//
//  Created by murad on 26.05.2026.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            
            SettingsHeaderView()
            
            VStack(spacing: 30) {
                
                VStack(spacing: 30) {
                    SectionTitleView(title: "Multiplication table")
                    
                    TableSelectorView(
                        currentTabel: viewModel.targetTable,
                        onDecrement: { viewModel.decrementTable() },
                        onIncrement: { viewModel.incrementTable() }
                    )
                }
                
                VStack(spacing: 15) {
                    SectionTitleView(title: "Questions")
                    
                    Picker("Questions", selection: $viewModel.questionCount) {
                        ForEach(viewModel.questionOptions, id: \.self) { option in
                            Text("\(option)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                PrimaryButton(title: "Start Game") {
                    viewModel.startGame()
                }
            }
            .whiteCardStyle()
        }
    }
}

#Preview {
    ZStack {
        AppBackgroundView()
        
        SettingsView(viewModel: GameViewModel())
    }
}


