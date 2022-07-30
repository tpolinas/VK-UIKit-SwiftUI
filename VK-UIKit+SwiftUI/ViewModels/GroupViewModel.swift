//
//  GroupViewModel.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//
import Foundation

class GroupViewModel: ObservableObject {
    
    @Published var groups: [Group] = []
    
    public func fetch() {
        Request<GroupData>().fetch(
            type: .groups
        ) { [weak self] result in
            switch result {
            case let .success(myGroups):
                let items = myGroups.map { item in
                    Group(
                        name: item.name,
                        avatar: item.photo
                    )
                }
                DispatchQueue.main.async {
                    self?.groups = items
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
