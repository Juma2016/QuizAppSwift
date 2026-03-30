import SwiftUI

struct ThemenView: View {
    let categories = ["Swift", "Java", "Web", "Databases"]

    var body: some View {
        NavigationStack {
            List(categories, id: \.self) { category in
                NavigationLink(category) {
                    QuizView(selectedCategory: category)
                }
            }
            .navigationTitle("Themen")
        }
    }
}
#Preview {
    ThemenView()
}
