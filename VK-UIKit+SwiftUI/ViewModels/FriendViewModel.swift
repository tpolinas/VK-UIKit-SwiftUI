//
//  FriendViewModel.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import Foundation

class FriendViewModel: ObservableObject {

    @Published var friends: [Friend] = []
    
    public func fetch() {
        Request<User>().fetch(
            type: .friends
        ) { [weak self] result in
            switch result {
            case let .success(myFriends):
                let items = myFriends.map { item in
                    Friend(
                        name: "\(item.lastName) \(item.firstName)",
                        avatar: item.photo,
                        id: item.id
                    )
                }
                DispatchQueue.main.async {
                    self?.friends = items
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

