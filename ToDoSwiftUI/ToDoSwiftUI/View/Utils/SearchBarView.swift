//
//  SearchBarView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 01/06/22.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText : String
    @State var isSeaching = false
    
    var body: some View {
       
        HStack{
            TextField("Search TODO",text: $searchText)
                .seachTextfieldStyle()
                .onTapGesture(perform: {
                    isSeaching = true
                })
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("lightBlue"))
                        Spacer()
                        
                        if isSeaching {
                            Button{
                                searchText = ""
                            }label: {
                                Image(systemName: "xmark.circle.fill")
                            }
                        }
                    }
                        .padding(.horizontal,8)
                        .foregroundColor(.gray)
                )
                .transition(.move(edge: .trailing))
            
            if isSeaching{
                Button(action: {
                    isSeaching = false
                    searchText = ""
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color("lightBlue"))
                        .padding(.trailing)
                        .padding(.leading,0)
                })
                .transition(.move(edge: .trailing))
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack{
            BackgroundGradiantView()
            SearchBarView(searchText: .constant(""))
        }
        
    }
}


struct SearchTextFiledModier :ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .padding(.leading,24)
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color(.systemGray6))
            .cornerRadius(15)
    }
}


extension View {
    func seachTextfieldStyle() -> some View{
        modifier(SearchTextFiledModier())
    }
}
