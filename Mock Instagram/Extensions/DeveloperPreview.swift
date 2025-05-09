//
//  DeveloperPreview.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/6/25.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(postOnwerUid: "123", commentText: "Test", postId: "231", timestamp: Timestamp(), commentOwnerUid: "1290232")
    
    let notifications: [Notification] = [
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "123", type: .follow),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "5643", type: .comment),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "346", type: .follow),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "764", type: .like),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "274", type: .like),
        .init(id: NSUUID().uuidString, timestamp: Timestamp(), notificationSenderUid: "853", type: .comment),
    ]
}
