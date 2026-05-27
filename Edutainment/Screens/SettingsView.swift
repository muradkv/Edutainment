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
        NavigationStack {
            Form {
                Section("Difficulty") {
                    Stepper("Up to: \(viewModel.targetTable)", value: $viewModel.targetTable, in: 2...12)
                }
                
                Section("Number of questions") {
                    Picker("Questions", selection: $viewModel.questionCount) {
                        ForEach(viewModel.questionOptions, id: \.self) { option in
                            Text("\(option)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Button("Start Game") {
                        viewModel.generateQuestions()
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(viewModel: GameViewModel())
}
