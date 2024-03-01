//
//  View_CreateWorkSpace.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import SwiftUI

struct Book {
    let title: String 
}

struct CreateWorkSpaceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var workspaceVM: WorkspaceViewViewModel = WorkspaceViewViewModel()
    @EnvironmentObject var authVM: AuthenticationManager
    let datum: [Book] = [Book(title: "Book 1"), Book(title: "Book 2")]
    var body: some View {
        NavigationStack {
            ZStack (alignment: .top) {
                Text("")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            ZStack {
                                HStack {
                                    Image(systemName: "arrow.backward")
                                        .resizable()
                                        .frame(width: 25, height: 20)
                                        .onTapGesture {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                        
                                    Spacer()
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Text("Create")
                                            .font(Font.custom("NotoSans-Medium", size: 16))
                                            .onTapGesture {
                                                self.workspaceVM.createNewWorkspace(
                                                    owner: authVM.currentAccount!.id,
                                                    name: workspaceVM.name,
                                                    description:workspaceVM.description
                                                ) {
                                                    
                                                }
                                            }
                                    })
                                }
                                
                                Text("Create new workspace")
                                    .foregroundColor(.black)
                                    .font(Font.custom("NotoSans-Medium", size: 16))
                            }
                        }
                    }
             
               
                VStack (alignment: .leading, spacing: 0.0) {
//                    List {
//                        Section {
//                            NavigationLink {
//                                
//                            }label: {
//                                Text("Generate Image with AI")
//                            }
//                        } header: {
//                            Text("Earning for Mays")
//                        }
//                    }
//                    .listStyle(.sidebar)
                    
                    
                    VStack (alignment: .leading) {
                        Text("Name of your workspace")
                            .font(.custom("NotoSans-Medium", size: 16))
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                        TextField("Name of workspace", text: $workspaceVM.name)
                            .font(.custom("NotoSans-SemiBold", size: 16))
                            .textFieldStyle(DefaultTextFieldStyle())
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(Color.gray, lineWidth: 0.45)
                            )
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
                    }
                    VStack (alignment: .leading) {
                        Text("Can you describe your workspace")
                            .font(.custom("NotoSans-SemiBold", size: 16))
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                        
                        TextField("Describe your workspace",
                                  text: $workspaceVM.description,
                                  axis: .vertical)
                        .font(.custom("NotoSans-Medium", size: 16))
                        .frame(minHeight: 70)
                        .lineLimit(2)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(Color.gray, lineWidth: 0.45)
                        )
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
                       
                    }
                }
                .padding(EdgeInsets(top: 36, leading: 0, bottom: 0, trailing: 0))
            }
            .onAppear() {
                DispatchQueue.main.async {
                    self.authVM.fetchCurrentAccount()
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            //            .navigationTitle("Create your workspace")
            //            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CreateWorkSpaceView()
        .environmentObject(AuthenticationManager())
}
