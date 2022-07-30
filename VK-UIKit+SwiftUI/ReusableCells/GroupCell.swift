//
//  GroupCell.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import SwiftUI
import Kingfisher

struct GroupCell: View {
    
    let name: String
    let avatar: String
    
    var body: some View {
        HStack {
            AvatarImage {
                KFImage(
                    URL(string: avatar)
                )
            }
            Text(name)
                .font(.title)
                .padding(.leading, 20)
                .lineLimit(1)
                .layoutPriority(1)
        }
        .padding()
    }
}

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupCell(
            name: "name",
            avatar: "group"
        )
    }
}
