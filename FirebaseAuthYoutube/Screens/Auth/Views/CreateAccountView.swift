//
//  CreateAccountView.swift
//  FirebaseAuthYoutube
//
//  Created by Hemal Patel on 2024-09-28.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Please complete all information to create an account.")
                .font(.headline).fontWeight(.medium)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
            InputView(
                placeholder: "Email or Phone number",
                text: $email
            )
            
            InputView(
                placeholder: "Full Name",
                text: $fullName
            )
            
            InputView(
                placeholder: "Password",
                isSecureField: true,
                text: $password
            )
            
            ZStack(alignment: .trailing) {
                InputView(
                    placeholder: "Confirm your password",
                    isSecureField: true,
                    text: $confirmPassword
                )
                
                Spacer()
                
                if !password.isEmpty && !confirmPassword.isEmpty {
                    Image(systemName: "\(isValidPassword ? "checkmark" : "xmark").circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(isValidPassword ? Color(.systemGreen) : Color(.systemRed))
                }
            }
            
            Spacer()
            
            Button {
                Task {
                    await authViewModel.createUser(
                        email: email,
                        fullName: fullName,
                        password: password
                    )
                    
                    if !authViewModel.isError {
                        router.navigateBack()
                    }
                }
            } label: {
                Text("Create Account")
            }
            .buttonStyle(CapsuleButtonStyle())

            
        }
        .navigationTitle("Set up your account")
        .toolbarRole(.editor)
        .padding()
        
    }
    
    var isValidPassword: Bool {
        confirmPassword == password
    }
}

#Preview {
    CreateAccountView()
        .environmentObject(AuthViewModel())
}
