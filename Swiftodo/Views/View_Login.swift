//
//  View_Login.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authenticationManager: AuthenticationManager
    @State private var isSignInWithGoogle: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                MonochromeButton(action: {
                    self.isSignInWithGoogle.toggle()
                    Task.init {
                        let success = await self.authenticationManager.signInWithGoogle() {
                            
                        }
                        self.isSignInWithGoogle.toggle()
                        
                        if success {
                            print("Da tao account thanh cong")
                        }
                    }
                }, text: "Sign In With Google")
            }
        }
    }
}

#Preview {
    LoginView()
}
