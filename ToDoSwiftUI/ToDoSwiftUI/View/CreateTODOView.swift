//
//  CreateTODO.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 02/06/22.
//

import SwiftUI

struct CreateTODOView: View {
    
    let appuser : AppUser
    
    @State var title : String = ""
    @State var TODOdescription : String = ""
    @State var TODOType : String = ""
    @State var completed : Bool = false
    
    @ObservedObject var viewModel = TODOViewModel()
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            
            TODOButtonStack(viewModel: viewModel)
                .padding()
                .padding(.top)
            
            TODOTextFileld(text: $title, placholder: "Title")
                .padding([.horizontal,.bottom])
            CustomTextEditor(text: $TODOdescription, placeholder: Text("Description ..."), imageName: "line.3.horizontal", foregroundColor: .gray)
                .padding([.horizontal,.bottom])
            
            HStack{
                Button{
                    if title != ""{
                        viewModel.uploadTODO(todo: TODO(ownerUid: appuser.id ?? "", title: title, description: TODOdescription, TODOType: viewModel.filterTODOSelected == .all ? "Extra" : viewModel.filterTODOSelected.rawValue, completed: false))
                        viewModel.showCreatTODOView =  false
                        
                    }
                    else{
                        showingAlert = true
                    }
                    
                }label: {
                    CreateTODOButton()
                }
                .alert(isPresented:$showingAlert) {
                            Alert(
                                title: Text("Alert"),
                                message: Text("Please Insert Title"),
                                dismissButton: .default(Text("Done"))
                            )
                        }
                
                Button{
                    viewModel.showCreatTODOView =  false
                }label: {
                    CancelTODOButton()
                }
            }
            Spacer()
            
            
        }
        .frame(width: UIScreen.main.bounds.size.width - 80, height: 380, alignment: .center)
        .background(Color(.systemGray5))
        .cornerRadius(25)
    }
}

struct CreateTODO_Previews: PreviewProvider {
    static var previews: some View {
        CreateTODOView(appuser: appUser01, viewModel: TODOViewModel())
    }
}


struct CreateTODOButton : View {
    var body: some View {
        Text("Create")
            .font(.headline)
            .foregroundColor(Color.white)
            .frame(width: 120, height: 40, alignment: .center)
            .background(Color.blue.opacity(0.6))
            .clipShape(Capsule())
        
    }
}

struct CancelTODOButton : View {
    var body: some View {
        Text("Cancel")
            .font(.headline)
            .foregroundColor(Color.white)
            .frame(width: 120, height: 40, alignment: .center)
            .background(Color.red.opacity(0.6))
            .clipShape(Capsule())
        
    }
}
