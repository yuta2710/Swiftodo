//
//  UI_TabBar.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import SwiftUI

struct TabBar: View {
    @Binding var currentTab: Tab
    
    var body: some View {
        GeometryReader() { geometry in
            let width = geometry.size.width
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button(action: {
                        // Set animation during current tab moving coor y
                        withAnimation(.easeInOut){
                            self.currentTab = tab
                        }
                    }, label: {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                            .frame(maxWidth: .infinity)
                            .offset(y: currentTab == tab ? -17 : 0)
                    })
                }
            }
            .frame(maxWidth: .infinity)
            .background() {
                Circle()
                    .fill(Color("deep-teal-1"))
                    .frame(width: 80, height: 80)
                    .shadow(color: .black.opacity(0.25), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .rotationEffect(.degrees(110))
                    .offset(x: offset(width: width), y: -17)
            }
            
        }
        .frame(height: 24)
        .padding(.top, 20)
//        .background(
//            Rectangle()
//                
//                .frame(height: 120)
//                
//                .padding(.top, 30)
//            
//                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 0)
//            
//            
//                
//        )
        
        
    }
    
    func offset(width: CGFloat) -> CGFloat {
        let index = CGFloat(index())
        
        if index == 0 { return 0 }
        
        let btnWidth = (width / CGFloat(Tab.allCases.count))
        
        return (index * btnWidth)
        
    }
    
    func index() -> Int {
        switch currentTab {
        case .today:
            return -1
        case .profile:
            return 0
        case .search:
            return 1
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthenticationManager())
}
