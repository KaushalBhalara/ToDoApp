//
//  LoginView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 24/05/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : AuthViewModel
    
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
                        viewModel.login(withEmail: email, password: password)
                    }label: {
                        AuthenticationButtonView(text: "Sign In")
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
