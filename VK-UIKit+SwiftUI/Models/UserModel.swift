//
//  UserModel.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import Foundation

class Friend: Identifiable {
    let id: UUID = UUID()
    let _id: Int
    let name: String
    let avatar: String
    
    init(
        name: String,
        avatar: String,
        id: Int
    ) {
        self.name = name
        self.avatar = avatar
        self._id = id
    }
}



struct FriendsResponse {
    let response: Friends
}

extension FriendsResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct Friends {
    let count: Int
    let items: [User]
}

extension Friends: Codable {
    enum CodingKeys: String, CodingKey {
        case count
        case items
    }
}

struct User {
    let id: Int
    let firstName: String
    let lastName: String
    let photo: String
    let photo100: String
    let photo200: String
}

extension User: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}

