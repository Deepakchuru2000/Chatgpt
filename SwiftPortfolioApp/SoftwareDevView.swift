import SwiftUI

struct Project: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

struct SoftwareDevView: View {
    let projects: [Project] = [
        Project(title: "App 1", description: "A cool iOS application."),
        Project(title: "App 2", description: "Another awesome project."),
        Project(title: "App 3", description: "SwiftUI demo with animations.")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(projects) { project in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(project.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(project.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Button(action: {}) {
                            Text("View Details")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.accent)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .background(Color.neutralBackground)
    }
}

struct SoftwareDevView_Previews: PreviewProvider {
    static var previews: some View {
        SoftwareDevView()
    }
}
