//
//  PasswordTextField.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 25/05/22.
//

import SwiftUI

struct PasswordTextField: View {
    
    @Binding var text:String
    let placeholder : String
    
    var body: some View {
        CustomSecureTextField(text: $text, placeholder: Text(placeholder))
            .padding()
            .foregroundColor(.white)
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradiantView()
            PasswordTextField(text: .constant("") ,placeholder:"Password")
        }
    }
}
