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
                        .padding(.horizontal, 20)
                }
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
