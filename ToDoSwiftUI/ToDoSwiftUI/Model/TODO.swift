//
//  TODO.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 26/05/22.
//

import Foundation
import FirebaseFirestoreSwift

struct TODO : Identifiable, Decodable {
    
    @DocumentID var id: String? = UUID().uuidString
    let ownerID: String
    var title: String
    var description: String
    var TODOType: String
    var completed: Bool
    var documentID: String? = ""
    
    func getType() -> SelectedButton {
        if TODOType == "Groceries"
        {
            return .groceries
        }
        else if TODOType == "Work"
        {
            return .work
        }
        else if TODOType == "Home"
        {
            return .home
        }
        else if TODOType == "School"
        {
            return .school
        }
        else if TODOType == "Personal"
        {
            return .personal
        }
        else{
            return .extra
        }
    }
}
