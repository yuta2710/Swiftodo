//
//  View_Home.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("Home View")
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthenticationManager())
}
