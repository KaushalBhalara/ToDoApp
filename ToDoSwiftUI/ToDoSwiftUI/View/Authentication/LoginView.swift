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
    
    var body: some View {
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
                AuthenticationButtonView(text: "Sign In")

            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
