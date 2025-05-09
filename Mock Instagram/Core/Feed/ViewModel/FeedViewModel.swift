//
//  FeedViewModel.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/6/25.
//

import Foundation
import Firebase


class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
