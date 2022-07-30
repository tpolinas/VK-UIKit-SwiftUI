//
//  PhotoView.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import SwiftUI
import Kingfisher

struct PhotosView: View {
    
    @ObservedObject var viewModel: PhotoViewModel
    
    private let columns: [GridItem]
    private var size: CGFloat = 100
    var id: Int
    
    init(
        viewModel: PhotoViewModel,
        id: Int
    ) {
        self.id = id
        self.viewModel = viewModel
        columns = [
            GridItem(.fixed(self.size)),
            GridItem(.fixed(self.size)),
            GridItem(.fixed(self.size))
        ]
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(
                        0..<viewModel.photos.count, id: \.self
                    ) { index in
                        ZStack {
                            KFImage(
                                URL(string: viewModel.photos[index].imageName)
                            )
                                .resizable()
                                .frame(
                                    width: size,
                                    height: size
                                )
                                .cornerRadius(size/10)
                                .clipped()
                            AnimatedLikeButton(isPressed: false)
                        }
                    }
                }.frame(
                    width: geometry.size.width,
                    height: geometry.size.height
                )
            .onAppear(perform: viewModel.fetch)
            }
        }
    }
}


struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView(
            viewModel: PhotoViewModel(id: 0),
            id: 1
        )
    }
}
