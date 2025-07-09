import SwiftUI

struct ZoomableImage: View {
    let imageName: String
    @State private var scale: CGFloat = 1.0

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .gesture(MagnificationGesture()
                        .onChanged { value in
                            scale = value
                        }
            )
            .scaleEffect(scale)
            .animation(.easeInOut, value: scale)
    }
}

struct PhotographyView: View {
    let images = ["photo1", "photo2", "photo3", "photo4", "photo5", "photo6"]

    @State private var selectedImage: String? = nil

    let columns = [GridItem(.adaptive(minimum: 120), spacing: 16)]

    var body: some View {
        ZStack {
            Color.neutralBackground.ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(images, id: \.self) { img in
                        Image(img)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 120)
                            .clipped()
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .onTapGesture {
                                withAnimation {
                                    selectedImage = img
                                }
                            }
                    }
                }
                .padding()
            }
            if let img = selectedImage {
                Color.black.opacity(0.8)
                    .ignoresSafeArea()
                    .transition(.opacity)
                ZoomableImage(imageName: img)
                    .transition(.scale)
                    .onTapGesture {
                        withAnimation {
                            selectedImage = nil
                        }
                    }
            }
        }
        .animation(.easeInOut, value: selectedImage)
    }
}

struct PhotographyView_Previews: PreviewProvider {
    static var previews: some View {
        PhotographyView()
    }
}
