//
//  UI_SolidButton.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 01/03/2024.
//

import SwiftUI

struct SolidButton: View {
    var text: String
    var bgColor: Color
    var textColor: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text(text)
                .font(Font.custom("NotoSans-Medium", size: 18))
                .frame(maxWidth: .infinity)
                .padding()
                .background(bgColor)
                .cornerRadius(12.0)
                .foregroundColor(textColor)
                .padding(EdgeInsets(top: 4, leading: 24, bottom: 4, trailing: 24))
        })
    }
}

#Preview {
    SolidButton(text: "Get started", bgColor: Color("deep-teal-1"), action: {})
}
