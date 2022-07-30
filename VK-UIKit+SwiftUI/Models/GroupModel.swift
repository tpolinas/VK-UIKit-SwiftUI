//
//  GroupModel.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import Foundation

class Group: Identifiable {
    let id: UUID = UUID()
    let name: String
    let avatar: String
    
    init(
        name: String,
        avatar: String
    ) {
        self.name = name
        self.avatar = avatar
    }
}


struct GroupsResponse {
    let response: Groups
}

extension GroupsResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct Groups {
    let count: Int
    let items: [GroupData]
}

extension Groups: Codable {
    enum CodingKeys: String, CodingKey {
        case count
        case items
    }
}

struct GroupData {
    let id: Int
    let name: String
    let photo: String
}

extension GroupData: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_50"
    }
}

