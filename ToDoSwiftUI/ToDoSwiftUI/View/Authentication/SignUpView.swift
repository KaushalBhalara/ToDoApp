//
//  SignUpView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 24/05/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State var firstname = ""
    @State var lastname = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @Environment(\.presentationMode) var mode
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        ZStack{
            
            BackgroundGradiantView()
            
            VStack{
                LogoView()
                    .padding(.bottom, 25)
                
                VStack(spacing:20){
                    UserTextField(text: $firstname, placeholder: "First Name")
                    UserTextField(text: $lastname, placeholder: "Last Name")
                    EmailTextField(text: $email)
                    PasswordTextField(text: $password, placeholder: "Password")
                    PasswordTextField(text: $confirmPassword, placeholder: "Confirm Password")
                }
                .padding(.horizontal,25)
                .padding(.bottom,25)
                
                Button{
                    viewModel.register(withEmail: email, password: password, firstName: firstname, lastName: lastname)
                }label: {
                    AuthenticationButtonView(text: "Sign Up")
                    
                }
                
                Spacer()
                
                Button{
                    mode.wrappedValue.dismiss()
                }label: {
                    
                    HStack{
                        Text("Already have an account?")
                            .font(.system(size: 15))
                        Text("Sign In")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                }.padding(16)
            }
            .padding(.top,30)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
