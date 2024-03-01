//
//  ViewModel_Workspace.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 01/03/2024.
//

import Foundation
import FirebaseFirestore

class WorkspaceViewViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var description: String = ""
    
//    members: [String]
    func insertNewWorkspaceToFirestore(workspaceData: [String: Any], callback: @escaping () -> ()) {
        let db = Firestore.firestore()
        
        do{
            try db.collection("workspaces").document(workspaceData["id"] as! String).setData(workspaceData){ error in
                print("\n\n[SUCCESS] -- Create workspace successfully")
            }
        }catch let error {
            
        }
        callback()
    }
    
    func createNewWorkspace(owner: String, name: String, description: String, callback: @escaping () -> ()) {
        let workspaceId = UUID().uuidString
        let workspaceData = WorkspaceEntity(
            id: workspaceId,
            name: name,
            description: description,
            owner: owner,
            members: [],
            tasks: []
        )
        
        self.insertNewWorkspaceToFirestore(
            workspaceData: workspaceData.asDictionary(),
            callback: callback
        )
        
    }
}
