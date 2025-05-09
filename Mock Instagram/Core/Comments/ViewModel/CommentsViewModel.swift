//
//  CommentsViewModel.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/6/25.
//

import FirebaseAuth
import Firebase

@MainActor
class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    
    private let post: Post
    private let service: CommentService
    
    init(post: Post) {
        self.post = post
        self.service = CommentService(postId: post.id)
        
        Task { try await fetchComments() }
    }
    
    func uploadComment(commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let comment = Comment(
            postOnwerUid: post.ownerUid,
            commentText: commentText,
            postId: post.id,
            timestamp: Timestamp(),
            commentOwnerUid: uid
        )
    
        try await service.uploadComment(comment)
        try await fetchComments()
        
        NotificationManager.shared.uploadCommentNotification(toUid: post.ownerUid, post: post)
    }
    
    
    func fetchComments() async throws {
        self.comments = try await service.fetchComments()
        try await fetchUserDataForComments()
    }
    
    private func fetchUserDataForComments() async throws {
        for i in 0 ..< comments.count {
            let comment = comments[i]
            let user = try await UserService.fetchUser(withUid: comment.commentOwnerUid)
            comments[i].user = user
        }
    }
}
