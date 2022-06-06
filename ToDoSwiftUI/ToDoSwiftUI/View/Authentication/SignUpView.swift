//
//  SignUpView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 24/05/22.
//

import SwiftUI

enum ActiveSignupAlert{
    case fname,lname,email,password,cpassword,passmatch
}


struct SignUpView: View {
    
    @State var firstname = ""
    @State var lastname = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @State private var showAlert =  false
    @State private var SingupAlert : ActiveSignupAlert = .fname
    
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
                    if firstname.isEmpty{
                        SingupAlert = .fname
                        showAlert = true
                        return
                    }
                    if lastname.isEmpty{
                        SingupAlert = .lname
                        showAlert = true
                        return
                    }
                    if email.isEmpty{
                        SingupAlert = .email
                        showAlert = true
                        return
                    }
                    if password.isEmpty {
                        SingupAlert =  .password
                        showAlert = true
                        return
                    }
                    if confirmPassword.isEmpty {
                        SingupAlert =  .cpassword
                        showAlert = true
                        return
                    }
                    if password != confirmPassword {
                        SingupAlert =  .passmatch
                        showAlert = true
                        return
                    }
                    viewModel.register(withEmail: email, password: password, firstName: firstname, lastName: lastname)
                }label: {
                    AuthenticationButtonView(text: "Sign Up")
                    
                }
                .alert(isPresented:$showAlert){
                    switch SingupAlert {
                    case .fname:
                        return Alert(
                            title: Text("Alert"),
                            message: Text("Please Insert FirstName"),
                            dismissButton: .default(Text("Done")))
                    case .lname:
                        return Alert(
                            title: Text("Alert"),
                            message: Text("Please Insert LastName"),
                            dismissButton: .default(Text("Done")))
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
                    case .cpassword:
                        return Alert(
                            title: Text("Alert"),
                            message: Text("Please Insert Confirm Password"),
                            dismissButton: .default(Text("Done")))
                    case .passmatch:
                        return Alert(
                            title: Text("Alert"),
                            message: Text("Password & Confirm Password does not match"),
                            dismissButton: .default(Text("Done")))
                    }
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
