//
//  ColorTreatments.swift
//  CustomVisualEffects
//
//  Created by Vedant Mistry on 01/02/26.
//

import SwiftUI

struct ColorTreatments: View {
    var body: some View {
        MeshGradient(
            width: 2,
            height: 3,
            points: [
                [0.0, 0.0], [1.0, 0.0],
                [0.0, 0.5], [1.0, 0.5],
                [0.0, 1.0], [1.0, 1.0]
                //                [0, 1], [0.5, 1], [1, 1]
            ],
            colors: [.red, .orange,
                     .yellow, .blue,
                     .purple, .pink]
        )
    }
}

#Preview {
    ColorTreatments()
}
