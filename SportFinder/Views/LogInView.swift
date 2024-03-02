import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var loginError = false
    @EnvironmentObject var core: UserAuth
    
    var body: some View {
        NavigationStack {
            VStack {
                // Image
                Image("login_symbol")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 119)
                    .padding(.vertical, 32)
                
                // Form Fields
                VStack(spacing: 23) {
                    inputTemplate(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    inputTemplate(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // Sign in Button
                Button {
                    Task {
                        do {
                            try await core.signIn(withEmail: email, password: password)
                            loginError = true
                        }
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32 , height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
                if loginError {
                    Text("Login failed. Email Adress or Password is wrong.")
                        .foregroundColor(.red)
                        .padding(.top, 8)
                        //.background(Color.yellow)
                }
                
                Spacer()
                
                // Sign up Button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocal {
    var formIsValid: Bool {
        return !email.isEmpty
           ///Users/simonlundgren/Documents/SportFinder/SportFinder/SportFinder/Views && email.contains("@")
           // && !password.isEmpty
           // && password.count > 3
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

