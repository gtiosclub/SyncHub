//
//  AuthenticationView.swift
//  SyncHub
//
//  Created by Steven Liu on 2/14/26.
//

import SwiftUI

struct AuthenticationView: View {
    @Environment(AuthProvider.self) private var authProvider
    @State private var password = ""
    @State private var email = ""

    var body: some View {
        VStack(alignment: .leading) {
            TextField("email", text: $email).textFieldStyle(.roundedBorder)

            TextField("password", text: $password).textFieldStyle(.roundedBorder)

            Text("*Make sure you note your credentials down somewhere")
                .font(.footnote).foregroundStyle(.secondary)


            Button("Sign up") {
                authProvider.signUp(email: email, password: password)
            }
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
    }
}

#Preview {
    AuthenticationView()
        .environment(AuthProvider.shared)
}
