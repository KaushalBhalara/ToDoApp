//
//  AppUser.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 26/05/22.
//

import Foundation
import FirebaseFirestoreSwift

struct AppUser : Identifiable, Decodable {
    
    @DocumentID var id: String?
    let uid : String
    let firstName : String
    let lastName: String
    let email : String

    
    
}
