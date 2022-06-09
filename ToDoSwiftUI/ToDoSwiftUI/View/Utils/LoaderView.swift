//
//  LoaderView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 08/06/22.
//

import SwiftUI

struct LoaderView: View {
    
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 2.0
    
    var body: some View {
        VStack {
            ProgressView()
                       .scaleEffect(scaleSize, anchor: .center)
                   .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
        }
        
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}


