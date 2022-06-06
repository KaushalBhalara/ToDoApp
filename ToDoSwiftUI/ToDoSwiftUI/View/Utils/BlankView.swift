//
//  BlankView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 02/06/22.
//

import SwiftUI

struct BlankView: View {
    @ObservedObject var viewModel = TODOViewModel()
    
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity, alignment: .center)
        .background(Color.black)
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture(count: 1, perform: {
            viewModel.showCreatTODOView =  false
        })
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
