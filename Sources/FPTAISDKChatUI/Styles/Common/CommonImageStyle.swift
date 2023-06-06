//
//  CommonImageStyle.swift
//
//
//
//

import SwiftUI

public struct CommonImageStyle {

    public let imageSize:    CGSize
    public let cornerRadius: CGFloat
    public let borderColor:  Color
    public let borderWidth:  CGFloat
    public let shadowRadius: CGFloat
    public let shadowColor:  Color
    // MARK: - UI update for BOT Avatar
    public init(
        imageSize:    CGSize = .init(width: 32, height: 32),
        cornerRadius: CGFloat = 16,
        borderColor:  Color = Color.green.opacity(0.0),
        borderWidth:  CGFloat = 0,
        shadowRadius: CGFloat = 0,
        shadowColor:  Color = .secondary
    ) {
        self.imageSize = imageSize
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.shadowRadius = shadowRadius
        self.shadowColor = shadowColor
    }

}
