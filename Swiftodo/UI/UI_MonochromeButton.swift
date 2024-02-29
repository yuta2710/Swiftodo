//
//  UI_MonochromeButton.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import SwiftUI

struct MonochromeButton: View {
    var action: () -> Void
    var text: String
    var bgColor: Color = Color("deep-teal-1")
    var foregroundTextColor: Color = Color.white
    var iconNameFromAssetStorage: String = "google"
    
    var body: some View {
        Button(action: action,
               label: {
            HStack {
                
                Image(iconNameFromAssetStorage)
                    .resizable()
                    .frame(width: 20, height: 20)
                
                
                Text(text)
                    .font(.custom("NotoSans-Medium", size: 16))
                    .foregroundColor(.black)
            }
            
        })
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
        .background(
            RoundedRectangle(cornerRadius: 12.0)
                .stroke(Color.gray, lineWidth: 1.0)
                .shadow(color: .black, radius: 15, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1.0)
        )
        .cornerRadius(12.0)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        
    }
}

#Preview {
    MonochromeButton(action: {}, text: "Sign In With Google")
}
