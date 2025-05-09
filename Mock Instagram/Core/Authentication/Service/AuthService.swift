//
//  AuthService.swift
//  Mock Instagram
//
//  Created by Jaewon Oh on 4/30/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthService {
    
    @Published var userSession: FirebaseAuth.User? // check whether user is loggined in. if so lead to landing page
    
    
    static let shared = AuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await self.uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        try await UserService.shared.fetchCurrentUser()
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.currentUser = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        UserService.shared.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await FirebaseConstants.UsersCollection.document(user.id).setData(encodedUser) // upload data
    }
}
