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
        ZStack {
            LinearGradient(
                colors: [Color.cyan.opacity(0.3), Color.purple.opacity(0.3)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                VStack(spacing: 8) {
                    Text("Math tables")
                        .font(.system(size: 36, weight: .heavy, design: .rounded))
                    
                    Text("Set up your game")
                        .font(.system(size: 18, weight: .light, design: .rounded))
                        .foregroundColor(.gray)
                }
                
                VStack(spacing: 30) {
                    
                    VStack(spacing: 30) {
                        Text("Multiplication table".uppercased())
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 25) {
                            Button {
                                viewModel.decrementTable()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                    .frame(width: 50, height: 50)
                                    .background(Color.gray.opacity(0.2))
                                    .foregroundColor(.primary)
                                    .clipShape(Circle())
                            }
                            
                            Text("\(viewModel.targetTable)")
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
                            
                            Button {
                                viewModel.incrementTable()
                            } label: {
                                Image(systemName: "chevron.right")
                                    .font(.title2)
                                    .frame(width: 50, height: 50)
                                    .background(Color.gray.opacity(0.2))
                                    .foregroundColor(.primary)
                                    .clipShape(Circle())
                            }
                        }
                    }
                                        
                    VStack(spacing: 15) {
                        Text("Questions".uppercased())
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Picker("Questions", selection: $viewModel.questionCount) {
                            ForEach(viewModel.questionOptions, id: \.self) { option in
                                Text("\(option)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                                        
                    Button("Start Game") {
                        viewModel.generateQuestions()
                    }
                    .font(.system(.title3, design: .rounded).bold())
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
                .padding(30)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    SettingsView(viewModel: GameViewModel())
}
