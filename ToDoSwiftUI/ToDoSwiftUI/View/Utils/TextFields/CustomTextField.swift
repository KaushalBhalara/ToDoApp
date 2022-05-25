//
//  CustomTextField.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 24/05/22.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    var forgroundColor: Color?
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty
            {
                placeholder.foregroundColor(forgroundColor ?? Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading,40)
            }
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(forgroundColor ?? .white)
                
                TextField("",text: $text)
                    .autocapitalization(.none)
                    .padding(.leading, 14)
                
            }
        }
    }
}
 
struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
        }
        
    }
}
