//
//  MetalShaders.swift
//  CustomVisualEffects
//
//  Created by Vedant Mistry on 01/02/26.
//

import SwiftUI

import SwiftUI

struct MetalShaders: View {
    @State private var origin: CGPoint = .zero
        @State private var triggerTime: Double = 0
        let startDate = Date()

        var body: some View {
            TimelineView(.animation) { context in
                let elapsedTime = context.date.timeIntervalSince(startDate) - triggerTime
                
                VStack {
                    Image("image-3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                        .layerEffect(
                            ShaderLibrary.Ripple(
                                .float2(origin),
                                .float(Float(elapsedTime)),
                                .float(5),
                                .float(10),
                                .float(2.0),
                                .float(400)
                            ),
                            maxSampleOffset: CGSize(width: 30, height: 30)
                        )
                        .gesture(
                            SpatialTapGesture().onEnded { value in
                                origin = value.location
                                triggerTime = Date().timeIntervalSince(startDate)
                            }
                        )
                }
            }
        }}

#Preview {
    MetalShaders()
}
