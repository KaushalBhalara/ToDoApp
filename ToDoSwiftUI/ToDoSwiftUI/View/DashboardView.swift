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
                    .padding()
                TODOButtonStack(viewModel: viewModel)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                if viewModel.todosFiltered.isEmpty {
                    AddTODOLogo()
                        .padding(.top)
                }
                
                ScrollView{
                    VStack(spacing: 15){
                        ForEach(viewModel.todosFiltered, id:\.id) { todo in
                            if searchText == "" {
                                TODOView(todo: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), viewModel: viewModel)
                            }
                            else
                            {
                                if todo.title.lowercased().contains(searchText.lowercased()) || todo.description.lowercased().contains(searchText.lowercased()){
                                    TODOView(todo: TODO(ownerUid: todo.ownerUid, title: todo.title, description: todo.description, TODOType: todo.TODOType, completed: todo.completed, documentID: todo.documentID), viewModel: viewModel)
                                }
                            }
                        }
                    }
                }
                
            }
            .overlay(
                VStack{
                    Spacer()
                    HStack {
                        Spacer()
                        Button{
                            viewModel.showCreatTODOView = true
                        }label: {
                            Image(systemName: "plus")
                                .padding()
                                .background(Color("lightBlue"))
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .frame(width: 50, height: 50, alignment: .center)
                                .cornerRadius(25)
                                .shadow(color: .gray, radius: 1, x: 3, y: 1)
                        }
                        .padding()
                    }
                }
            )
            if viewModel.showCreatTODOView {
                BlankView(viewModel: viewModel)
                CreateTODOView(appuser: user, viewModel: viewModel)
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
