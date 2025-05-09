//
//  NotificationView.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/8/25.
//

import SwiftUI

struct NotificationView: View {
    @StateObject var viewModel = NotificationViewModel(service: NotificationService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.notifications) { notification in
                        NotificationCell(notification: notification)
                            .padding(.top)
                        
                    }
                }
            }
            .refreshable {
                Task { await viewModel.fetchNotifications() }
            }
            .navigationDestination(for: Post.self, destination: { post in
                FeedCell(post: post)
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationView()
}
