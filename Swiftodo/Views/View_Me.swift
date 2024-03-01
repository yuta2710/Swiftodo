//
//  View_Me.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import SwiftUI

struct MeView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    var body: some View {
        ZStack {
            VStack {
                if let currentUser = authenticationManager.currentAccount, authenticationManager.isSignIn {
                    Text(currentUser.name)
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.async {
                authenticationManager.fetchCurrentAccount()
            }
        }
    }
}

#Preview {
    MeView()
        .environmentObject(AuthenticationManager())
}
