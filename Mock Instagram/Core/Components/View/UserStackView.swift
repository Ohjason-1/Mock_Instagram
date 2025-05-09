//
//  UserStackView.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 4/25/25.
//

import SwiftUI

struct UserStackView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .opacity(value == 0 ? 0.5 : 1.0)
        .frame(width: 76)
    }
}

#Preview {
    UserStackView(value: 12, title: "Posts")
}
