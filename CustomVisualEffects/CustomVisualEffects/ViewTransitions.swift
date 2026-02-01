//
//  ViewTransitions.swift
//  CustomVisualEffects
//
//  Created by Vedant Mistry on 01/02/26.
//

import SwiftUI

struct ViewTransitions: View {
    @State var isActive: Bool = true
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 40) {
            if isActive {
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(Color.indigo)
//                    .transition(.opacity.combined(with: .scale))
//                    .transition(CustomTranstion())
//                    .transition(.blurReplace)
//                    .transition(.move(edge: .bottom).combined(with: .blurReplace))
                    .transition(.move(edge: .trailing).combined(with: CustomTranstion()))
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                isActive.toggle()
            }
        }
    }
}

// Custom transition
struct CustomTranstion: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .scaleEffect(phase.isIdentity ? 1.0 : 0.5)
            .opacity(phase.isIdentity ? 1.0 : 0.0)
            .blur(radius: phase.isIdentity ? 0.0 : 20.0)
    }
}

#Preview {
    ViewTransitions()
}
