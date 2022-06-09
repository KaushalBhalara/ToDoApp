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

    @State var isHideLoader: Bool = true
    
    var body: some View {
        ZStack {
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
                            self.isHideLoader = false
                            viewModel.uploadTODO(todo: TODO(ownerUid: appuser.id ?? "", title: title, description: TODOdescription, TODOType: viewModel.filterTODOSelected == .all ? "Extra" : viewModel.filterTODOSelected.rawValue, completed: false))
                            viewModel.showCreatTODOView =  false
                            self.isHideLoader = true
                        }
                        else{
                            showingAlert = true
                            print(viewModel.selectedTODO)
                            print(viewModel.selectedTODO[0].title)
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
            VStack{
                if self.isHideLoader == false{
                    LoaderView(tintColor:Color("lightBlue"), scaleSize: 2.0).padding().hidden(isHideLoader)
                }
               
            }
            
            
        }
        
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

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
