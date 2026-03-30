import Foundation
import Combine
import UIKit

class QuizViewModel: ObservableObject {
    @Published var allQuestions: [QuizQuestion] = QuizDataLoader.loadQuestions()
    @Published var questions: [QuizQuestion] = []
    @Published var currentQuestionIndex: Int = 0
    @Published var score: Int = 0
    @Published var selectedAnswer: String? = nil
    @Published var showResult: Bool = false
    @Published var resultMessage: String = ""
    @Published var quizFinished: Bool = false

    let selectedCategory: String?

    init(category: String? = nil, randomCount: Int = 10) {
        self.selectedCategory = category

        if let category = category {
            questions = allQuestions.filter { $0.category == category }
        } else {
            questions = Array(allQuestions.shuffled().prefix(randomCount))
        }
    }

    var currentQuestion: QuizQuestion {
        questions[currentQuestionIndex]
    }

    func submitAnswer() {
        guard let selectedAnswer = selectedAnswer else { return }

        if selectedAnswer == currentQuestion.correctAnswer {
            score += 10
            resultMessage = "Correct!"
            SoundManager.playSound(named: "correct")
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        } else {
            resultMessage = "Wrong! Correct answer: \(currentQuestion.correctAnswer)"
            SoundManager.playSound(named: "wrong")
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }

        showResult = true
    }

    func nextQuestion() {
        selectedAnswer = nil
        showResult = false
        resultMessage = ""

        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            finishQuiz()
        }
    }

    func finishQuiz() {
        quizFinished = true

        let defaults = UserDefaults.standard

        let oldScore = defaults.integer(forKey: "totalScore")
        defaults.set(oldScore + score, forKey: "totalScore")

        let oldCompleted = defaults.integer(forKey: "completedQuizzes")
        defaults.set(oldCompleted + 1, forKey: "completedQuizzes")

        if let category = selectedCategory {
            defaults.set(category, forKey: "favoriteCategory")
        }
    }

    func restartQuiz() {
        currentQuestionIndex = 0
        score = 0
        selectedAnswer = nil
        showResult = false
        resultMessage = ""
        quizFinished = false

        if let category = selectedCategory {
            questions = allQuestions.filter { $0.category == category }
        } else {
            questions = Array(allQuestions.shuffled().prefix(10))
        }
    }
}
