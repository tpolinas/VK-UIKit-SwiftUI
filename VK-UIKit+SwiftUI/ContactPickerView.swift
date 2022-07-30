//
//  ContactPickerView.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 25.07.2022.
//

import SwiftUI
import UIKit

struct ContactPickerView: View {
    
    @ObservedObject var delegate = ContactPickerDelegate()
    @State private var selectionView = 1

    private var navTitleName = [
        "Friends",
        "Groups",
        "News"
    ]

    var body: some View {
        TabView(
            selection: $selectionView
        ) {
            VStack {
                FriendsView(
                    viewModel: FriendViewModel()
                )
            }.tabItem {
                Image(systemName: "person.2")
                Text("Friends")
            }.tag(1)

            VStack {
                GroupsView(
                    viewModel: GroupViewModel()
                )
            }.tabItem {
                Image(systemName: "person.3")
                Text("Groups")
            }.tag(2)

            VStack {
                FeedView()
            }.tabItem {
                Image(systemName: "newspaper")
                Text("Feed")
            }.tag(3)

        }
        .onChange(of: delegate.contact) { newValue in
            self.delegate.contact = newValue
        }
        .navigationTitle(
            navTitleName[selectionView - 1]
        )
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactPickerView()
//    }
//}
