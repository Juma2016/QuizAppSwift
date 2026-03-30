//
//  QuizDataLoader.swift
//  QUIZ
//
//  Created by Mario Shenouda on 16.03.26.
//

import Foundation

class QuizDataLoader {
    static func loadQuestions() -> [QuizQuestion] {
        guard let url = Bundle.main.url(forResource: "questions", withExtension: "json") else {
            print("questions.json not found")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let questions = try JSONDecoder().decode([QuizQuestion].self, from: data)
            return questions
        } catch {
            print("Error loading questions: \(error)")
            return []
        }
    }
}
