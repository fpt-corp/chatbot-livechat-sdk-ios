//
//  CarouselItemButtonStyle.swift
//
//
//
//

import SwiftUI

internal struct CarouselItemButtonStyle: ButtonStyle {

    public let backgroundColor: Color

    public init(backgroundColor: Color = .blue) {
        self.backgroundColor = backgroundColor
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .foregroundColor(.white)
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(backgroundColor)
        .opacity(1)
        .scaleEffect(configuration.isPressed ? 0.98 : 1, anchor: .center)
    }
}
