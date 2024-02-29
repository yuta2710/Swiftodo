//
//  Manager_Authentication.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import SwiftUI


class AuthenticationManager: ObservableObject {
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    @Published var isShowAlert: Bool = false
    @Published var currentAccount: AccountEntity? = nil
    
    var isSignIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    func insertAccountDocumentToFirestore(accountData: [String: Any], callback: @escaping () -> ()) -> Void {
        let db = Firestore.firestore()
        
        do {
            try db.collection("accounts")
                .document(accountData["id"] as! String)
                .setData(accountData) { error in
                    if let error = error {
                        print("Unable to set data")
                    }
                    
                    print("[SUCCESS - CREATED ACCOUNT] User created with id \(String(describing: accountData["id"]))")
                }
        }catch let error {
            
        }
        callback()
    }
    
    // Sign In with Google
    func signInWithGoogle(callback: @escaping () -> ()) async -> Bool {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No client ID found in Firebase Configuration")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = await windowScene.windows.first,
              let rootViewController = await window.rootViewController else {
            print("There is not root view controller")
            return false
        }
        
        do{
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuthentication.user
            guard let idToken = user.idToken else {
                print("Token is missing")
                return false
            }
            
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken.tokenString,
                accessToken: accessToken.tokenString)
            
            let result = try await Auth.auth().signIn(with: credential)
            let firebaseUser = result.user
        
            
            let accountData = AccountEntity(
                id: firebaseUser.uid,
                email: firebaseUser.email!,
                name: firebaseUser.displayName!,
                avatar: "",
                associatedWorkspaces: [],
                taskAssigned: [],
                taskCreated: [],
                workspaceOwned: [],
                isActive: true,
                joined: Date().timeIntervalSince1970
            )
            
            self.insertAccountDocumentToFirestore(accountData: accountData.asDictionary(), callback: callback)
            
//            DispatchQueue.main.async {
//                if let url = firebaseUser.photoURL?.absoluteString {
//                    self.currentAccount = AccountEntity(
//                        id: firebaseUser.uid,
//                        email: firebaseUser.email!,
//                        name: firebaseUser.displayName!,
//                        avatar: url,
//                        associatedWorkspaces: [],
//                        taskAssigned: [],
//                        taskCreated: [],
//                        workspaceOwned: [],
//                        isActive: true,
//                        joined: Date().timeIntervalSince1970
//                    )
//                }
//                
//            }
            print("\n\nUser \(firebaseUser.uid) signed in with \(firebaseUser.email ?? "Unknown")")
            return true
        }catch let error {
            print(error.localizedDescription)
        }
        
        return false
    }
    
    
    
    func signInDefault(email: String, pwd: String, callback: @escaping () -> ()) {
        
    }
    
    func signUpDefault(email: String, pwd: String, callback: @escaping () -> ()) {
        
    }
    
    func signOutFromGoogle() {
        
    }
    
    func signOutDefault() {
        
    }
    
    func updateAccountInformation(uId: String, key: String, value: String) {
        let db = Firestore.firestore()
        let docsRef = db.collection("accounts").document(uId)
        
        docsRef.setData([key: value], merge: true) { error in
            if let error = error {
                print("Error while updating document \(uId)")
            }else {
                print("Document \(uId) successfully merged")
            }
            
        }
    }
}

