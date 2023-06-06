//
//  TextCellStyle.swift
//
//
//
//

import SwiftUI
import UIKit

public struct TextCellStyle: CommonViewStyle {

    public let textStyle: CommonTextStyle
    public let textPadding: CGFloat

    public let attributedTextStyle: AttributedTextStyle

    // MARK: - CellContainerStyle
    public let cellBackgroundColor: Color
    public let cellCornerRadius: CGFloat
    public let cellBorderColor: Color
    public let cellBorderWidth: CGFloat
    public let cellShadowRadius: CGFloat
    public let cellShadowColor: Color
    public let cellRoundedCorners: UIRectCorner
    public let cellRoundedBotCorners: UIRectCorner
    public let cellRoundedClientCorners: UIRectCorner

    // MARK: - UI update text show
    public init(
        textStyle: CommonTextStyle = CommonTextStyle(
            textColor: .white,
            font: .body,
            fontWeight: .regular
        ),
        textPadding: CGFloat = 10,
        attributedTextStyle: AttributedTextStyle = AttributedTextStyle(
            textColor: UIColor(Color(hex: "#516C95")),
            font:  UIFont.preferredFont(forTextStyle: .body),
            fontWeight: .regular
        ),
        cellBackgroundColor: Color = Color(hex: "#0052CC"),
        cellCornerRadius: CGFloat = 16,
        cellBorderColor: Color = .clear,
        cellBorderWidth: CGFloat = 1,
        cellShadowRadius: CGFloat = 3,
        cellShadowColor: Color = .secondary,
        cellRoundedCorners: UIRectCorner = .allCorners,
        cellRoundedBotCorners: UIRectCorner =  [.topRight, .bottomLeft, .bottomRight],
        cellRoundedClientCorners: UIRectCorner = [.topLeft, .bottomLeft, .bottomRight]
    ) {
        self.textStyle = textStyle
        self.textPadding = textPadding
        self.attributedTextStyle = attributedTextStyle
        self.cellBackgroundColor = cellBackgroundColor
        self.cellCornerRadius = cellCornerRadius
        self.cellBorderColor = cellBorderColor
        self.cellBorderWidth = cellBorderWidth
        self.cellShadowRadius = cellShadowRadius
        self.cellShadowColor = cellShadowColor
        self.cellRoundedCorners = cellRoundedCorners
        self.cellRoundedBotCorners = cellRoundedBotCorners
        self.cellRoundedClientCorners = cellRoundedClientCorners
    }

}
