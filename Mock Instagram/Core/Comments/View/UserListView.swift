//
//  UserListView.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/8/25.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    @State private var searchText = ""
    
    private let config: UserListConfig
    
    init(config: UserListConfig) {
        self.config = config
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.users) { user in
                    NavigationLink(value: user) {
                        HStack {
                            CircularProfileImageView(user: user, size: .xSmall)
                            
                            VStack(alignment: .leading) {
                                Text(user.username)
                                    .fontWeight(.semibold)
                                
                                if let fullname = user.fullname {
                                    Text(fullname)
                                }
                            }
                            .font(.footnote)
                            
                            Spacer()
                        }
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top, 8)
            .searchable(text: $searchText, prompt: "Search ...")
        }
        .task { await viewModel.fetchUsers(forConfig: config)}
    }
}

#Preview {
    UserListView(config: .explore)
}
