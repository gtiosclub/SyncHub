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
    @State private var signup = true
    @Namespace private var animation

    var body: some View {
        VStack(alignment: .leading) {
            credentialsView

            if signup {
                signupView
            } else {
                signinView
            }
        }
        .padding()
    }

    @ViewBuilder
    private var credentialsView: some View {
        TextField("email", text: $email).textFieldStyle(.roundedBorder)
        TextField("password", text: $password).textFieldStyle(.roundedBorder)
    }

    @ViewBuilder
    private var signupView: some View {
        Text("*Make sure you note your credentials down somewhere")
            .font(.footnote).foregroundStyle(.secondary)

        Button("Sign up") {
            authProvider.signUp(email: email, password: password)
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(.borderedProminent)
        .padding()

        HStack {
            Text("Have an account? ")
            Button("Sign in") {
               signup = false
            }
        }
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    private var signinView: some View {
        Text("*Make sure you note your credentials down somewhere")
            .font(.footnote).foregroundStyle(.secondary).opacity(0)
        Button("Sign in") {
            authProvider.signIn(email: email, password: password)
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(.borderedProminent)
        .padding()

        HStack {
            Text("Don't have an account yet? ")
            Button("Sign up") {
               signup = true
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AuthenticationView()
        .environment(AuthProvider.shared)
}
