//
//  User.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 4/26/25.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isFollowed: Bool? = false // unique to individual user
    var stats: UserStats?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

struct UserStats: Codable, Hashable {
    var followingCount: Int
    var followersCount: Int
    var postsCount: Int
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "J1", profileImageUrl: nil, fullname: "Jason Oh", bio: "Student", email: "ohjaewon2001@gmail.com"),
        .init(id: NSUUID().uuidString, username: "G1", profileImageUrl: nil, fullname: "G Oh", bio: "Student", email: "g1@gmail.com"),
        .init(id: NSUUID().uuidString, username: "F1", profileImageUrl: nil, fullname: "F Oh", bio: "Student", email: "f1@gmail.com"),
        .init(id: NSUUID().uuidString, username: "D1", profileImageUrl: nil, fullname: "D Oh", bio: "Student", email: "d1@gmail.com"),
        .init(id: NSUUID().uuidString, username: "S1", profileImageUrl: nil, fullname: "S Oh", bio: "Student", email: "s1@gmail.com")
        
    ]
}
