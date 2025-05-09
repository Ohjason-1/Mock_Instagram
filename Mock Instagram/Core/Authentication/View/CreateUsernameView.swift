//
//  CreateUsernameView.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 4/25/25.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
            VStack(spacing: 12) {
                Text("Create username")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Pick a username for your new account. You can always change it later")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                TextField("Username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                
                NavigationLink {
                    CreatePasswordView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                .padding(.vertical)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                }
            }
        }
    }
}

#Preview {
    CreateUsernameView()
        .environmentObject(RegistrationViewModel())
}
