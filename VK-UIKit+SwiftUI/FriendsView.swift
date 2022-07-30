//
//  FriendsView.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import SwiftUI

struct FriendsView: View {
    
    @ObservedObject var viewModel: FriendViewModel
    
    init(
        viewModel: FriendViewModel
    ) {
        self.viewModel = viewModel
        viewModel.fetch()
    }
    
    var body: some View {
        List(
            viewModel.friends.sorted(by: {
                $0.name < $1.name
            })
        ) { friend in
            NavigationLink(
                destination: PhotosView(
                    viewModel: PhotoViewModel(
                        id: friend._id
                    ),
                    id: friend._id
                )) {
                FriendCell(
                    name: friend.name,
                    avatar: friend.avatar
                )
            }
        }
        .onAppear(perform: viewModel.fetch)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(
            viewModel: FriendViewModel()
        )
    }
}
