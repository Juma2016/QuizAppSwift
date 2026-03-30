import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            ThemenView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Themen")
                }

            QuizView()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Quizzes")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            LocationView()
                .tabItem {
                    Label("Location", systemImage: "location.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
