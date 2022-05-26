//
//  UserTextField.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 26/05/22.
//

import SwiftUI

struct UserTextField: View {
    @Binding var text:String
    let placeholder : String
    
    var body: some View {
        CustomTextField (text: $text, placeholder: Text(placeholder), imageName: "person")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct UserTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradiantView()
            UserTextField(text: .constant(""), placeholder: "User")
        }
    }
}
