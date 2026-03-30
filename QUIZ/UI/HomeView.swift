import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()
                
                Text("Home")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 80)

                Image(systemName: "brain.head.profile")
                    .font(.system(size: 90))
                    .foregroundColor(.blue)

                Text("Q-App")
                    .font(.largeTitle)
                    .bold()

                Text("Learn programming with quizzes")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)

                NavigationLink {
                    QuizView()
                } label: {
                    Text("Start Quiz")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(16)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            

        }
    }
}
#Preview {
    HomeView()
}
