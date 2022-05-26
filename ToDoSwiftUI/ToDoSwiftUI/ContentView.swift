//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : AuthViewModel
//    @EnvironmentObject var viewModel = AuthViewModel
    
    var body: some View {
        
        Group{
            if viewModel.userSession == nil{
                LoginView()
            }
            else {
                if let user = viewModel.currentUser {
                    DashboardView(user: user)
                }
            }
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
