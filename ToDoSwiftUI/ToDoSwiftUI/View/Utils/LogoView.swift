//
//  LogoView.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 25/05/22.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
       
        VStack(){
            
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text("To Do App")
                .foregroundColor(.white)
                .font(.system(size: 25))
                .fontWeight(.semibold)
            
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradiantView()
            LogoView()
        }
    }
}
