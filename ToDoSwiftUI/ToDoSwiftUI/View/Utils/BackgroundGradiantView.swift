//
//  BackgroundGradiantView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 24/05/22.
//

import SwiftUI

struct BackgroundGradiantView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    
    }
}

struct BackgroundGradiantView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradiantView()
    }
}
