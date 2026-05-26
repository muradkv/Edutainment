//
//  Question.swift
//  Edutainment
//
//  Created by murad on 25.05.2026.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let factor1: Int
    let factor2: Int
    
    var text: String { "\(factor1) x \(factor2)" }
    var answer: Int { factor1 * factor2 }
}
