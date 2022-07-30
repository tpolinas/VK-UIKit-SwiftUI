//
//  UserView.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import SwiftUI

struct UserView: View {
    
    @ObservedObject var viewModel: FriendViewModel
    @ObservedObject var delegate = ContactPickerDelegate()
    
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
        .onChange(of: delegate.contact) { newValue in
            self.delegate.contact = newValue
        }
        .onAppear(perform: viewModel.fetch)
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView(viewModel: )
//    }
//}
