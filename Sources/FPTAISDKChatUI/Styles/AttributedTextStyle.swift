//
//  AttributedTextStyle.swift
//
//
//
//
import SwiftUI

public struct AttributedTextStyle {

    public let textColor: UIColor
    public let font: UIFont
    public let fontWeight: UIFont.Weight

    public init(
        textColor: UIColor = .black,
        font: UIFont = .monospacedSystemFont(ofSize: 12, weight: .regular),
        fontWeight: UIFont.Weight = .regular
    ) {
        self.textColor = textColor
        self.font = font
        self.fontWeight = fontWeight
    }
}
