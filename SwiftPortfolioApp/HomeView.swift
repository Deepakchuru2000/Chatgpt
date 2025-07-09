import SwiftUI

struct HomeView: View {
    @State private var showGreeting = false

    var body: some View {
        ZStack {
            Color.neutralBackground.ignoresSafeArea()
            VStack {
                if showGreeting {
                    Text("Welcome to My Portfolio")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.accent)
                        .transition(.opacity)
                }
            }
            .onAppear {
                withAnimation(.easeIn(duration: 1.0)) {
                    showGreeting = true
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
