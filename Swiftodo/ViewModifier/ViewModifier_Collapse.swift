//
//  ViewModifier_Collapse.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 01/03/2024.
//

import SwiftUI

struct CollapsedView: View {
    var id = UUID()
    @ViewBuilder var content: any View
    
    var body: some View {
        ZStack {
            AnyView(content)
        }
    }
}
