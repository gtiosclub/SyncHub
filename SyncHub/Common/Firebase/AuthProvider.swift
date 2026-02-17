//
//  AuthProvider.swift
//  SyncHub
//
//  Created by Steven Liu on 2/14/26.
//

import Firebase
import FirebaseAuth

@Observable
final class AuthProvider {
    static var shared = AuthProvider()
    private var auth: Auth

    var user: User?
    var isSignedIn = false

    private init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        self.auth = Auth.auth()
        self.user = auth.currentUser
        self.isSignedIn = user != nil
    }

    func signUp(email: String, password: String) {
        guard password.count >= 6 else {
            print("Password must have at least 6 characters")
            return
        }
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error {
                let nsError = error as NSError
                print("Sign Up Error: \(error.localizedDescription)")
                print("  Code: \(nsError.code), domain: \(nsError.domain)")
                print("  UserInfo: \(nsError.userInfo)")
                if let authError = AuthErrorCode(rawValue: nsError.code) {
                    print("  AuthErrorCode: \(authError)")
                }
                return
            }
            self.user = result?.user
            self.isSignedIn = true
        }
    }

    func signIn(email: String, password: String) {
        guard password.count >= 6 else {
            print("Password must have at least 6 characters")
            return
        }
        auth.signIn(withEmail: email, password: password) { result, error in
            if let error {
                let nsError = error as NSError
                print("Sign In Error: \(error.localizedDescription)")
                print("  Code: \(nsError.code), domain: \(nsError.domain)")
                print("  UserInfo: \(nsError.userInfo)")
                if let authError = AuthErrorCode(rawValue: nsError.code) {
                    print("  AuthErrorCode: \(authError)")
                }
                return
            }
            self.user = result?.user
            self.isSignedIn = true
        }
    }

    func signOut() {
        do {
            try auth.signOut()
            self.user = nil
            self.isSignedIn = false
        } catch {
            print("Sign Out Error: \(error.localizedDescription)")
        }
    }
}
