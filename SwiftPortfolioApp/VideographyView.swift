import SwiftUI
import AVKit

struct VideoItem: Identifiable {
    let id = UUID()
    let url: URL
    let thumbnail: String
}

struct VideographyView: View {
    let videos: [VideoItem] = [
        VideoItem(url: URL(string: "video1")!, thumbnail: "videoThumb1"),
        VideoItem(url: URL(string: "video2")!, thumbnail: "videoThumb2"),
        VideoItem(url: URL(string: "video3")!, thumbnail: "videoThumb3")
    ]

    @State private var selectedVideo: URL? = nil

    var body: some View {
        ZStack {
            Color.neutralBackground.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(videos) { video in
                        Image(video.thumbnail)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .onTapGesture {
                                selectedVideo = video.url
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

struct VideographyView_Previews: PreviewProvider {
    static var previews: some View {
        VideographyView()
    }
}
