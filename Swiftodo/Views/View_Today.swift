//
//  View_Home.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    CollapsibleCardView(
                        thumbnail: ThumbnailView(content: {
                            VStack {
                                Text("Wanna have sex ?")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(.white)
                            }
                            .padding()
                        }),
                        collapsed: CollapsedView(content: {
                            VStack {
                                Text("Wanna have sex ?")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(.white)
                                
                                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum")
                                    .foregroundStyle(.white)
                            }
                        }))
                }
            }
            .scrollIndicators(.never)
        }
    }
}

#Preview {
    TodayView()
        .environmentObject(AuthenticationManager())
}
