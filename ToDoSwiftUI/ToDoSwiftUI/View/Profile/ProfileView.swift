//
//  ProfileView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 17/06/22.
//

import SwiftUI

struct ProfileView: View {
    
    let user: AppUser
    
    var body: some View {
        ZStack {
            BackgroundGradiantView()
            VStack {
                LogoView()
                    .padding(.bottom,25)
                VStack (spacing:20) {
                    UserTextField(text: .constant(user.firstName), placeholder: "")
                        .disabled(true)
                    UserTextField(text: .constant(user.lastName), placeholder: "")
                        .disabled(true)
                    EmailTextField(text: .constant(user.email))
                        .disabled(true)
                }
                .padding(.horizontal, 25)

            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user:appUser01)
    }
}
