import SwiftUI
import AVKit

struct PaperToy: Identifiable {
    let id = UUID()
    let image: String
    let videoURL: URL
}

struct PaperToysView: View {
    let toys: [PaperToy] = [
        PaperToy(image: "toy1", videoURL: URL(string: "toyVideo1")!),
        PaperToy(image: "toy2", videoURL: URL(string: "toyVideo2")!),
        PaperToy(image: "toy3", videoURL: URL(string: "toyVideo3")!)
    ]

    @State private var selectedVideo: URL? = nil

    var body: some View {
        ZStack {
            Color.neutralBackground.ignoresSafeArea()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(toys) { toy in
                        VStack(spacing: 8) {
                            Image(toy.image)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                                .onTapGesture {
                                    selectedVideo = toy.videoURL
                                }
                            Text("Watch Assembly")
                                .foregroundColor(.accent)
                        }
                    }
                }
                .padding()
            }
            if let url = selectedVideo {
                VideoPlayer(player: AVPlayer(url: url))
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        selectedVideo = nil
                    }
            }
        }
    }
}

struct PaperToysView_Previews: PreviewProvider {
    static var previews: some View {
        PaperToysView()
    }
}
