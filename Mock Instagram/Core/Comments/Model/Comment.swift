//
//  Comment.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/6/25.
//

import Firebase
import FirebaseFirestore

struct Comment: Identifiable, Codable {
    @DocumentID var commentId: String?
    let postOnwerUid: String
    let commentText: String
    let postId: String
    let timestamp: Timestamp
    let commentOwnerUid: String
    
    var user: User?
    
    var id: String {
        return commentId ?? NSUUID().uuidString
    }
}
