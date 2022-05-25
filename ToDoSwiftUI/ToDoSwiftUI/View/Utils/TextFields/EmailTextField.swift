//
//  EmailTextField.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 25/05/22.
//

import SwiftUI

struct EmailTextField: View {
    
    @Binding var text: String
    
    var body: some View {
        CustomTextField (text: $text, placeholder: Text("Email"), imageName: "envelope")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradiantView()
            EmailTextField(text: .constant("Email"))
        }
    }
}
