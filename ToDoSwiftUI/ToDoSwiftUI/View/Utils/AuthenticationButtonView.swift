//
//  AuthenticationButtonView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 25/05/22.
//

import SwiftUI

struct AuthenticationButtonView: View {
    let text : String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 360, height: 50, alignment: .center)
            .background(Color.blue.opacity(0.9))
            .clipShape(Capsule())
    }
}

struct AuthenticationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AuthenticationButtonView(text: "Sign In")
        }
    }
}
