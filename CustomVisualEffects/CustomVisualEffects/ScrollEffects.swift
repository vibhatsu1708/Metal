//
//  ScrollEffects.swift
//  CustomVisualEffects
//
//  Created by Vedant Mistry on 01/02/26.
//

import SwiftUI

struct ScrollEffects: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(1..<7) { index in
                    PhotoSlide(imageName: "image", count: index)
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content
//                                .rotationEffect(.degrees(phase.value * 3))
                                .offset(x: phase.value * -100)
//                                .offset(y: phase.isIdentity ? 0 : 16)
//                                .scaleEffect(phase.isIdentity ? 1.0 : 0.9)
                            
                        }
                        .containerRelativeFrame(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: 40.0))
                }
            }
            .scrollTargetLayout()
        }
        .safeAreaPadding(.horizontal, 40)
        .scrollTargetBehavior(.viewAligned)
    }
}

struct PhotoSlide: View {
    let imageName: String
    let count: Int
    
    var body: some View {
        Image("\(imageName)-\(count)")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 320, height: 350)
    }
}
#Preview {
    ScrollEffects()
}
