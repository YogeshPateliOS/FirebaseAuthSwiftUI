import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // logo
                logo
                // title
                titleView
                
                Spacer().frame(height: 12)
                
                // textfields
                InputView(
                    placeholder: "Email or Phone number",
                    text: $email
                )
                
                InputView(
                    placeholder: "Password",
                    isSecureField: true,
                    text: $password
                )
                // forgot button
                forgotButton
                
                // login button
                loginButton
                
                Spacer()
                
                // bottom view
                bottomView
            }
        }
        .ignoresSafeArea()
        .padding(.horizontal)
        .padding(.vertical, 8)
        .alert("Something went wrong", isPresented: $authViewModel.isError) {}
    }
    
    private var logo: some View {
        Image("login_image")
            .resizable()
            .scaledToFit()
    }
    
    private var titleView: some View {
        Text("Let's Connect With US!")
            .font(.title2)
            .fontWeight(.semibold)
    }
    
    private var forgotButton: some View {
        HStack {
            Spacer()
            Button {
                router.navigate(to: .forgotPassword)
            } label: {
                Text("Forgot Password?")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
    }
    
    private var loginButton: some View {
        Button {
            Task {
                await authViewModel.login(email: email, password: password)
            }
        } label: {
            Text("Login")
        }
        .buttonStyle(CapsuleButtonStyle())
    }
    
    private var line: some View {
        VStack { Divider().frame(height: 1) }
    }
    
    private var bottomView: some View {
        VStack(spacing: 16) {
            lineorView
            appleButton
            googleButton
            footerView
        }
    }
    
    private var lineorView: some View {
        HStack(spacing: 16) {
            line
            Text("or")
                .fontWeight(.semibold)
            line
        }
        .foregroundStyle(.gray)
    }
    
    private var appleButton: some View {
        Button {
            
        } label: {
            Label("Sign up with Apple", systemImage: "apple.logo")
        }
        .buttonStyle(
            CapsuleButtonStyle(
                bgColor: .black
            )
        )
    }
    
    private var googleButton: some View {
        Button {
            
        } label: {
            HStack {
                Image("google")
                    .resizable()
                    .frame(width: 15, height: 15)
                Text("Sign up with Google")
            }
        }
        .buttonStyle(
            CapsuleButtonStyle(
                bgColor: .clear,
                textColor: .black,
                hasBorder: true
            )
        )
    }
    
    private var footerView: some View {
        Button {
            router.navigate(to: .createAccount)
        } label: {
            HStack {
                Text("Don't have an account?")
                    .foregroundStyle(.black)
                Text("Sign Up")
                    .foregroundStyle(.teal)
            }
            .fontWeight(.medium)
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
