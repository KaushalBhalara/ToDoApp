//
//  DashboardView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 26/05/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    var body: some View {
        VStack{
            Text("Dashbaord \(user.email)")
            
            Button{
                AuthViewModel.shared.signout()
            }label: {
                Text("Sign Out")
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
