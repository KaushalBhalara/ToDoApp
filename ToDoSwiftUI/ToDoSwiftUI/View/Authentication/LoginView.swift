//
//  LoginView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 24/05/22.
//

import SwiftUI

enum ActiveAlert {
    case email, password
}

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : AuthViewModel
    @State private var showAlert = false
    @State private var showingAlert_Login : ActiveAlert = .email
    
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundGradiantView()
                VStack{
                    LogoView()
                    Spacer()
                        .frame(height: 25)
                    VStack(spacing: 20){
                        EmailTextField(text: $email)
                        
                        PasswordTextField(text: $password, placeholder: "Password")
                    }
                    .padding(.horizontal, 25)
                    
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Forgot Password")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))
                                .padding(5)
                                .padding(.trailing, 25)
                            
                        }
                    }
                    Spacer()
                        .frame(height: 50)
                    
                    Button{
                        if email.isEmpty
                        {
                            self.showingAlert_Login = .email
                            self.showAlert = true
                            return
                        }
                        if password.isEmpty
                        {
                            self.showingAlert_Login = .password
                            self.showAlert = true
                            return
                        }
                        viewModel.login(withEmail: email, password: password)
                    }label: {
                        AuthenticationButtonView(text: "Sign In")
                    }
                    .alert(isPresented:$showAlert) {
                        
                        switch self.showingAlert_Login {
                        case .email:
                            return Alert(
                                title: Text("Alert"),
                                message: Text("Please Insert email"),
                                dismissButton: .default(Text("Done")))
                        case .password:
                            return Alert(
                                title: Text("Alert"),
                                message: Text("Please Insert Password"),
                                dismissButton: .default(Text("Done")))
                        }
                                
                    }
                    
                    NavigationLink(destination: SignUpView()
                        .navigationBarHidden(true)) {
                            
                            
                            
                            HStack(){
                                
                                Text("Don't have a account?")
                                    .font(.system(size: 15))
                                Text("Sign Up")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                
                            }
                            .foregroundColor(.white)
                            .padding()
                            
                        }
                    
                    
                }
                .padding(.top, -100)
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            
        }
    }
}
