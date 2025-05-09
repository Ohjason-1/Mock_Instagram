//
//  CommentCell.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 5/6/25.
//

import SwiftUI

struct CommentCell: View {
    
    let comment: Comment
    
    private var user: User? {
        return comment.user
    }
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .xSmall)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(user?.username ?? "")
                        .fontWeight(.semibold)
                    
                    Text(comment.timestamp.timestampString())
                        .foregroundStyle(.gray)
                }
                
                Text(comment.commentText)
            }
            .font(.caption)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell(comment: dev.comment)
    }
}
