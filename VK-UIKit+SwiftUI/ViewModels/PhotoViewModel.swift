//
//  PhotoViewModel.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import Foundation

class PhotoViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    public func fetch() {
        Request<Albums>().fetch(
            type: .photos,
            id: self.id
        ) { [weak self] result in
            switch result {
            case let .success(myPhotos):
                let items = myPhotos.map { item in
                    Photo(
                        imageName: item.sizes[0].url
                    )
                }
                DispatchQueue.main.async {
                    self?.photos = items
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
