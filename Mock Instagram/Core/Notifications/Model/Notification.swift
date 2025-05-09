//
//  Notification.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/8/25.
//

import Firebase

struct Notification: Identifiable, Codable {
    let id: String
    var postId: String?
    let timestamp: Timestamp
    let notificationSenderUid: String
    let type: NotificationType
    
    var post: Post?
    var user: User?
    
    
}
