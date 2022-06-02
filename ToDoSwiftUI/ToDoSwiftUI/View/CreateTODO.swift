//
//  CreateTODO.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 02/06/22.
//

import SwiftUI

struct CreateTODO: View {
    
    let appuser : AppUser
    
    @State var title : String = ""
    @State var TODOdescription : String = ""
    @State var TODOType : String = ""
    @State var completed : Bool = false
    
    @ObservedObject var viewModel = TODOViewModel()
    
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
                    viewModel.uploadTODO(todo: TODO(ownerID: appuser.id ?? "", title: title, description: TODOdescription, TODOType: viewModel.filterTODOSelected == .all ? "Extra" : viewModel.filterTODOSelected.rawValue, completed: false))
                    viewModel.showCreatTODOView =  false
                }label: {
                    CreateTODOButton()
                }
                
                Button{
                    viewModel.showCreatTODOView =  false
                }label: {
                    CancelTODOButton()
                }
            }
            Spacer()
            
            
        }
        .frame(width: UIScreen.main.bounds.size.width - 100, height: 350, alignment: .center)
        .background(Color(.systemGray5))
        .cornerRadius(25)
    }
}

struct CreateTODO_Previews: PreviewProvider {
    static var previews: some View {
        CreateTODO(appuser: appUser01, viewModel: TODOViewModel())
    }
}


struct CreateTODOButton : View {
    var body: some View {
        Text("Create")
            .font(.headline)
            .foregroundColor(Color.white)
            .frame(width: 150, height: 40, alignment: .center)
            .background(Color.blue.opacity(0.6))
            .clipShape(Capsule())
        
    }
}

struct CancelTODOButton : View {
    var body: some View {
        Text("Cancel")
            .font(.headline)
            .foregroundColor(Color.white)
            .frame(width: 100, height: 40, alignment: .center)
            .background(Color.red.opacity(0.6))
            .clipShape(Capsule())
        
    }
}
