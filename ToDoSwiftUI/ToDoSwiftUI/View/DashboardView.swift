//
//  DashboardView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 26/05/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    @State var searchText: String = ""
    @ObservedObject var viewModel = TODOViewModel()
    
    var body: some View {
        ZStack
        {
            VStack{
                HStack{
                    Spacer()
                    Text("- All Done -")
                        .fontWeight(.semibold)
                        .font(.system(size: 24))
                    Spacer()
                    
                }
                .overlay{
                    HStack{
                        Spacer()
                        Button{
                            AuthViewModel.shared.signout()
                        }label: {
                            Text("Logout")
                                .foregroundColor(Color(.systemGray))
                        }
                        .padding(.trailing)
                    }
                }
                SearchBarView(searchText: $searchText)
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
