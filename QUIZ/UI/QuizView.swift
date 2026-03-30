import SwiftUI

struct QuizView: View {
    @StateObject private var viewModel: QuizViewModel
    @State private var showFinishAlert = false
    
    init(selectedCategory: String? = nil) {
        _viewModel = StateObject(wrappedValue: QuizViewModel(category: selectedCategory))
    }

    var body: some View {
        VStack(spacing: 20) {
            if viewModel.questions.isEmpty {
                Spacer()
                Text("No questions available")
                    .font(.title2)
                Spacer()
            } else {
                HStack {
                    Text("Question \(viewModel.currentQuestionIndex + 1)/\(viewModel.questions.count)")
                    Spacer()
                    Text("\(viewModel.score) P")
                }
                .padding()

                if viewModel.quizFinished {
                    Spacer()

                    Text("Quiz Finished!")
                        .font(.largeTitle)
                        .bold()

                    Text("Your Score: \(viewModel.score)")
                        .font(.title2)

                    Button("Restart Quiz") {
                        viewModel.restartQuiz()
                    }
                    .buttonStyle(.borderedProminent)

                    Spacer()
                } else {
                    Text(viewModel.currentQuestion.question)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding()

                    ForEach(viewModel.currentQuestion.answers, id: \.self) { answer in
                        Button {
                            viewModel.selectedAnswer = answer
                        } label: {
                            Text(answer)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    viewModel.selectedAnswer == answer
                                    ? Color.blue.opacity(0.3)
                                    : Color.gray.opacity(0.2)
                                )
                                .cornerRadius(10)
                                .scaleEffect(viewModel.selectedAnswer == answer ? 1.03 : 1.0)
                        }
                        .disabled(viewModel.showResult)
                    }

                    if viewModel.showResult {
                        Text(viewModel.resultMessage)
                            .padding()

                        Button("Next Question") {
                            if viewModel.currentQuestionIndex == viewModel.questions.count - 1 {
                                viewModel.nextQuestion()
                                showFinishAlert = true
                            } else {
                                viewModel.nextQuestion()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .alert("Quiz Finished!", isPresented: $showFinishAlert) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text("Your final score is \(viewModel.score)")
                        }
                    } else {
                        Button("Submit") {
                            viewModel.submitAnswer()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(viewModel.selectedAnswer == nil)
                    }

                    Spacer()
                    
                        .gesture(
                            DragGesture().onEnded { value in
                                if value.translation.width < -80 && viewModel.showResult {
                                    viewModel.nextQuestion()
                                }
                            }
                        )
                }
            }
        }
        .padding()
        .navigationTitle("Quiz")
        
    }
}

#Preview {
    QuizView()
}
