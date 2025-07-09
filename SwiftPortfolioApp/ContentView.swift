import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            SoftwareDevView()
                .tabItem {
                    Image(systemName: "laptopcomputer")
                    Text("Software")
                }

            PhotographyView()
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Photography")
                }

            VideographyView()
                .tabItem {
                    Image(systemName: "video.fill")
                    Text("Videography")
                }

            PaperToysView()
                .tabItem {
                    Image(systemName: "cube.box.fill")
                    Text("Paper Toys")
                }
        }
        .accentColor(Color("Accent"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
