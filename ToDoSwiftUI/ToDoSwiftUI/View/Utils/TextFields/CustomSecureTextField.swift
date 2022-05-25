//
//  CustomSecureTextField.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 25/05/22.
//

import SwiftUI

struct CustomSecureTextField: View {
    
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            if text.isEmpty
            {
                placeholder.foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading,40)
            }
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
                    .autocapitalization(.none)
                    .padding(.leading, 14)
            }
            
        }
    }
}

struct CustomSecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradiantView()
            CustomSecureTextField(text: .constant(""), placeholder: Text("Password"))
        }
    }
}
