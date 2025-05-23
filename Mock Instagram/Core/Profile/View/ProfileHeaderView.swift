//
//  ProfileHeaderView.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 4/27/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var showEditProfile = false
    
    private var user: User {
        return viewModel.user
    }
    
    private var isFollowed: Bool {
        return user.isFollowed ?? false
    }
    
    private var stats: UserStats {
        return user.stats ?? .init(followingCount: 0, followersCount: 0, postsCount: 0)
    }
    
    private var buttonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        } else {
            return isFollowed ? "Following" : "Follow"
        }
    }
    
    private var buttonBackgroundColor: Color {
        if user.isCurrentUser || isFollowed {
            return .white
        } else {
            return Color(.systemBlue)
        }
    }
    
    private var buttonForegroundColor: Color {
        if user.isCurrentUser || isFollowed {
            return .black
        } else {
            return .white
        }
    }
    
    private var buttonBorderdColor: Color {
        if user.isCurrentUser || isFollowed {
            return .gray
        } else {
            return .clear
        }
    }
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(spacing: 10) {
                // pic and stats
                HStack {
                    CircularProfileImageView(user: user, size: .large)
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        UserStackView(value: stats.postsCount, title: "Posts")
                        
                        NavigationLink(value: UserListConfig.followers(uid: user.id)) {
                            UserStackView(value: stats.followersCount, title: "Followers")
                        }
                        
                        
                        NavigationLink(value: UserListConfig.following(uid: user.id)) {
                            UserStackView(value: stats.followingCount, title: "Following")
                        }
                    }
                }
                .padding(.horizontal)
                
                // name and bio
                VStack(alignment: .leading, spacing: 4) {
                    if let fullname = user.fullname {
                        Text(fullname)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    
                    if let bio = user.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                    
                    Text(user.username)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // action button
                Button {
                    if user.isCurrentUser {
                        showEditProfile.toggle()
                    } else {
                        handleFollowTapped()
                    }
                } label: {
                    Text(buttonTitle)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundStyle(buttonForegroundColor)
                        .background(buttonBackgroundColor)
                        .cornerRadius(6)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(buttonBorderdColor, lineWidth: 1)
                        )
                }
                
                Divider()
            }
        .navigationDestination(for: UserListConfig.self, destination: { config in
            UserListView(config: config)
        })
        .onAppear() {
            viewModel.fetchUserStats()
            viewModel.checkIfUserIsFollowed()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
    
    func handleFollowTapped() {
        if isFollowed {
            viewModel.unfollow()
        } else {
            viewModel.follow()
        }
    }
}


#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[1])
}
