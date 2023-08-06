//
//  Question.swift
//  Quizzler
//
//  Created by Anna Zaitsava on 3.08.23.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    
    init(text: String, answer: [String], correctAnswer: String) {
        self.text = text
        self.answer = answer
        self.correctAnswer = correctAnswer
        
        }
}
