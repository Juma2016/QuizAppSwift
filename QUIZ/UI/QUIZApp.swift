//
//  QUIZApp.swift
//  QUIZ
//
//  Created by Mario Shenouda on 16.03.26.
//

import SwiftUI

@main
struct QUIZApp: App {
    @AppStorage("username") var username: String = ""

    var body: some Scene {
        WindowGroup {
            if username.isEmpty {
                WelcomeView()
            } else {
                ContentView()
            }
        }
    }
}
#Preview {
    ContentView()
}
