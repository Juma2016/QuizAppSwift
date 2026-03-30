//
//  WelcomeView.swift
//  QUIZ
//
//  Created by Mario Shenouda on 16.03.26.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("username") private var username: String = ""
    @State private var tempName: String = ""

    var body: some View {
        VStack(spacing: 25) {
            Spacer()

            Image(systemName: "person.crop.circle.badge.plus")
                .font(.system(size: 90))
                .foregroundColor(.blue)

            Text("Welcome")
                .font(.largeTitle)
                .bold()

            Text("Please enter your name to continue")
                .font(.headline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            TextField("Your name", text: $tempName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button(action: {
                let cleanName = tempName.trimmingCharacters(in: .whitespacesAndNewlines)
                if !cleanName.isEmpty {
                    username = cleanName
                }
            }) {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(tempName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.gray : Color.blue)
                    .cornerRadius(14)
            }
            .disabled(tempName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}
#Preview {
    WelcomeView()
}
