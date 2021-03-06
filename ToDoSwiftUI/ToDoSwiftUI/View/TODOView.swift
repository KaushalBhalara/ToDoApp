//
//  TODOView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 02/06/22.
//

import SwiftUI

struct TODOView: View {
    
    var todo:TODO
    @State private var showingAlert = false
    @ObservedObject var viewModel : TODOViewModel
    
    var body: some View {
        HStack {
            Button {
                if todo.completed {
                    viewModel.unCompletedTODO(todoID: todo.documentID ?? "")
                }
                else{
                    viewModel.completedTODO(todoID: todo.documentID ?? "")
                }
            } label: {
                Image(systemName: todo.completed ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(Color("lightBlue"))
            }
            VStack(alignment: .leading , spacing: 5){
                Text(todo.title)
                    .font(.system(size: 17))
                
                if todo.description != "" {
                    HStack{
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 15, height: 10, alignment: .center)
                            .foregroundColor(Color("lightBlue"))
                        
                        Text(todo.description)
                            .font(.system(size: 14))
                            .foregroundColor(Color(.systemGray2))
                    }
                    
                }
                
            }
            .padding(.leading,10 )
            .onTapGesture(count: 1, perform: {
                viewModel.showCreatTODOView =  true
                viewModel.selectedTODO =  viewModel.todos.filter { $0.documentID == todo.documentID }
                
            })
            Spacer()
            Button{
               
                self.showingAlert = true
            }label: {
                Image(systemName: "x.circle")
                    .foregroundColor(Color.red)
                    .frame(width: 22, height: 22, alignment: .center)
                
            }
            .alert(isPresented:$showingAlert) {
                        Alert(
                            title: Text("Are you want to Delete?"),
                            message: nil,
                            primaryButton: .destructive(Text("Delete")) {
                                viewModel.deleteTODO(todoID: todo.documentID ?? "")
                            },
                            secondaryButton: .cancel()
                        )
                    }
        }
        .padding(20)
        .frame(width: UIScreen.main.bounds.size.width - 25, height: 75, alignment: .center)
        .background(Color(.systemGray6))
        .cornerRadius(20)
    }
}

struct TODOView_Previews: PreviewProvider {
    static var previews: some View {
        TODOView(todo: mockData01, viewModel: TODOViewModel())
    }
}
