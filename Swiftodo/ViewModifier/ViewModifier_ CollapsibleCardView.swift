//
//  ViewModifier_ExpandableView.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 01/03/2024.
//

import SwiftUI

struct CollapsibleCardView: View {
    @Namespace private var namespace
    @State private var isCollapsible: Bool = false
    
    var thumbnail: ThumbnailView
    var collapsed: CollapsedView
    
    var body: some View {
        ZStack {
            if !isCollapsible {
                thumbnailView()
            }else {
                collapsedView()
            }
        }
        .onTapGesture {
            if !isCollapsible {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                    isCollapsible.toggle()
                }
            }
        }
    }
    
    @ViewBuilder
    private func thumbnailView() -> some View {
        ZStack {
            thumbnail
                .matchedGeometryEffect(id: "view", in: namespace)
        }
        .background(
            Color.gray
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
    }
    
    @ViewBuilder
    private func collapsedView() -> some View {
        ZStack {
            collapsed
                .matchedGeometryEffect(id: "view", in: namespace)
        }
        .background(
            Color.gray
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        
        Button(action: {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                self.isCollapsible.toggle()
            }
        }, label: {
            Image(systemName: "xmark")
                .foregroundStyle(.white)
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .matchedGeometryEffect(id: "mask", in: namespace)
    }
}
