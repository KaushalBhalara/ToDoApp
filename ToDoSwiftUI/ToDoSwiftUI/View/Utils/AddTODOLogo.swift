//
//  AddTODOLogo.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 02/06/22.
//

import SwiftUI

struct AddTODOLogo: View {
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack{
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: .center)
                .background(colorScheme == .dark ? .clear : .black)
                .cornerRadius(80)
            
            Text("Add your first TODO")
                .fontWeight(.bold)
                .font(.system(size: 25))
                .foregroundColor(colorScheme == .dark ? .white : .black)
            
        }
    }
}

struct AddTODOLogo_Previews: PreviewProvider {
    static var previews: some View {
        AddTODOLogo()
    }
}
