//
//  GroupView.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import SwiftUI

struct GroupsView: View {
    
    @ObservedObject var viewModel: GroupViewModel

    init(
        viewModel: GroupViewModel
    ) {
        self.viewModel = viewModel
        viewModel.fetch()
    }
    
    var body: some View {
        List(
            viewModel.groups.sorted(by: {
                $0.name < $1.name
            })
        ) { group in
            GroupCell(
                name: group.name,
                avatar: group.avatar
            )
        }
        .onAppear(perform: viewModel.fetch)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView(
            viewModel: GroupViewModel()
        )
    }
}
