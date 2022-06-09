//
//  TODOViewModel.swift
//  ToDoSwiftUI
//
//  Created by Kaushal Bhalara on 27/05/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

class TODOViewModel : ObservableObject {
    
    @Published var todos = [TODO]()
    @Published var showCreatTODOView : Bool = false
    @Published var filterTODOSelected : SelectedButton = .all
    @Published var todosFiltered = [TODO]()
    @Published var selectedTODO = [TODO]()
    
    init() {
        
        loadTODOs()
    }
    
    func loadTODOs(){
        
        guard let user = AuthViewModel.shared.currentUser else {return}
        
        let query = COLLECTION_USERS.document(user.uid ).collection("to-dos").order(by: "completed", descending: false)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.todos = documents.compactMap({ try?  $0.data(as: TODO.self)})
            
            for index in stride(from: 0, to: self.todos.count, by: 1)
            {
                self.todos[index].documentID = documents[index].documentID
            }
            self.todosFiltered = self.todos
            if self.filterTODOSelected != .all
            {
                self.todosFiltered = self.todos.filter({ todo in
                    return todo.TODOType == self.filterTODOSelected.rawValue
                })
            }
            else
            {
                self.todosFiltered = self.todos
            }
        }
    }
    
    func uploadTODO(todo: TODO){
        guard let user = AuthViewModel.shared.currentUser else {return}
        
        let data : [String: Any] = ["title":todo.title,
                                    "description":todo.description,
                                    "TODOType":todo.TODOType,
                                    "completed":todo.completed,
                                    "ownerUid":user.id ?? ""]
        
        COLLECTION_USERS.document(user.id ?? "").collection("to-dos").addDocument(data: data){ error in
            
            if let error = error {
                print("UploadTodo \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
        }
    }
    
    func deleteTODO(todoID: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoID).delete() { error in
            if let error = error {
                print("deleteTODO \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
        }
    }
    
    func completedTODO (todoID: String){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoID).updateData(["completed" : true]) { error in
            if let error = error {
                print("completedTODO \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
        }
    }
    
    func unCompletedTODO (todoID: String){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).collection("to-dos").document(todoID).updateData(["completed" : false]) { error in
            if let error = error {
                print("completedTODO \(error.localizedDescription)")
                return
            }
            self.loadTODOs()
        }
    }
    
}

