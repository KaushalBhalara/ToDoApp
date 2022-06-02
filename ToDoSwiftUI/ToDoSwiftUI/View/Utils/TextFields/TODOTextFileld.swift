//
//  TODOTextFileld.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 02/06/22.
//

import SwiftUI

struct TODOTextFileld: View {
    @Binding var text : String
    let placholder : String
    
    var body: some View {
        CustomTextField(text: $text, placeholder: Text(placholder), imageName: "checkmark.square", forgroundColor: .gray)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

struct TODOTextFileld_Previews: PreviewProvider {
    static var previews: some View {
        TODOTextFileld(text: .constant(""), placholder: "text")
    }
}
