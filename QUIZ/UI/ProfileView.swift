import SwiftUI

struct ProfileView: View {
    @AppStorage("username") private var username: String = ""
    @AppStorage("totalScore") private var totalScore: Int = 0
    @AppStorage("completedQuizzes") private var completedQuizzes: Int = 0
    @AppStorage("favoriteCategory") private var favoriteCategory: String = "None"

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 90))
                    .foregroundColor(.blue)

                Text("Hallo 👋 \(username) 😊")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)

                VStack(alignment: .leading, spacing: 14) {
                    Text("Total Score: \(totalScore)")
                        .font(.title3)

                    Text("Completed Quizzes: \(completedQuizzes)")
                        .font(.title3)

                    Text("Favorite Category: \(favoriteCategory)")
                        .font(.title3)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(16)

                Button("Reset Name") {
                    username = ""
                }
                .foregroundColor(.red)
                .padding(.top, 10)

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}
#Preview {
    ProfileView()
}
