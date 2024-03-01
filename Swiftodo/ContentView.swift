//
//  ContentView.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTab: Tab = .today
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentTab) {
                    TodayView()
                        .tabItem {
                            Label("Today", systemImage: Tab.today.rawValue)
                        }
                    
                    MeView()
                        .tabItem {
                            Label("Profile", systemImage: Tab.profile.rawValue)
                        }
                }
//                TabBar(currentTab: $currentTab)
            }
            
        }
    }
    
}
#Preview {
    ContentView()
        .environmentObject(AuthenticationManager())
}
