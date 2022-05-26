//
//  SelectedButton.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 26/05/22.
//

import Foundation

enum SelectedButton : String {
   
    
    
    case All = "All"
    case groceries = "Groceries"
    case work = "Work"
    case school = "School"
    case home = "Home"
    case personal = "Personal"
    case extra = "Extra"
    
    
    
    func getValue() -> String {
        return self.rawValue
    }
    
}
