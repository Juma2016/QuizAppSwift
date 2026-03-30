import Foundation

struct QuizQuestion: Identifiable, Codable {
    let id: UUID
    let category: String
    let question: String
    let answers: [String]
    let correctAnswer: String
}
