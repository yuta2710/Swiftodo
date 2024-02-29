//
//  ContentView.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var authVM: AuthenticateViewViewModel = AuthenticateViewViewModel()
    @State private var isSignIn: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
//                    Button(action: {
//                        isSignIn = true
//                        Task.init {
//                            let isSuccess = await authVM.signInWithGoogle()
//                            isSignIn = false
//                            
//                            if isSuccess {
//                                print("Hahaha dang nhap thanh cong rou ne")
//                            }else {
//                                print("Fail roi cha")
//                            }
//                        }
//                    }, label: {
//                        HStack {
//                            
//                            Image("google")
//                                .resizable()
//                                .frame(width: 20, height: 20)
//                            
//                            
//                            Text("Sign In With Google")
//                                .font(.custom("NotoSans-Medium", size: 16))
//                                .foregroundColor(.black)
//                        }
//                        
//                    })
//                    .frame(maxWidth: .infinity)
//                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
//                    .background(
//                        RoundedRectangle(cornerRadius: 12.0)
//                            .stroke(Color.gray, lineWidth: 1.0)
//                            .shadow(color: .black, radius: 15, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1.0)
//                    )
//                    .cornerRadius(12.0)
//                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
//                    
                    
                    
                }
            }
            .navigationTitle("Login")
            
            
        }
    }
    
}
#Preview {
    ContentView()
}
