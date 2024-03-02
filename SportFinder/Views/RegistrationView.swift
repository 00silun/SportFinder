//
//  RegistrationView.swift
//  Setting_template
//
//  Created by Sondre Lyngstad on 01/02/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var phone_number = ""
    @State private var date_of_birth = ""
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var core: UserAuth
    var body: some View {
        VStack{
            Image("login_symbol")
                .resizable()
                .scaledToFill()
                .frame(width:100, height:120)
                .padding(.vertical, 32)
            
            VStack(spacing:23){
                inputTemplate(text: $email,
                          title: "Email Adress",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                inputTemplate(text: $fullname,
                          title: "Full Name",
                          placeholder: "Enter your name")
                
                inputTemplate(text: $phone_number,
                          title: "Phone number",
                          placeholder: "Enter your phone number")
                
                inputTemplate(text: $date_of_birth, title: "Date of birth", placeholder: "XX.XX.XXXX")
                
                inputTemplate(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                ZStack(alignment: .trailing){
                    inputTemplate(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty{
                        if password == confirmPassword{
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        }else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        
                    }
                }
                
               
                }
                
            }
            .padding(.horizontal)
            .padding(.top,12)
            
            //Sign in Button
            Button{
                Task{
                    try await core.createUser(withEmail:email,
                                    password: password,
                                    fullname: fullname,
                                    phone_number: phone_number,
                                    date_of_birth: date_of_birth)
                }
            } label: {
                HStack{
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32 , height: 48)
            }
            .background(Color(.systemBrown))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button{
                dismiss()
            } label: {
                HStack(spacing:3){
                Text("Already have an account?")
                Text("Sign in")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol
extension RegistrationView: AuthenticationFormProtocal{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        
        && confirmPassword == password
        && !fullname.isEmpty
    }

}

