//
//  QuickReplyCellStyle.swift
//
//
//
//

import SwiftUI

// MARK: UI for quick reply
public struct QuickReplyCellStyle {

    /// If the total characters of all item's title is greater than this value, items ordered vertically
    public let characterLimitToChangeStackOrientation: Int

    public let selectedItemColor: Color
    public let selectedItemFont: Font
    public let selectedItemFontWeight: Font.Weight
    public let selectedItemBackgroundColor: Color

    public let unselectedItemColor: Color
    public let unselectedItemFont: Font
    public let unselectedItemFontWeight: Font.Weight
    public let unselectedItemBackgroundColor: Color

    public let itemVerticalPadding: CGFloat
    public let itemHorizontalPadding: CGFloat
    public let itemBorderWidth: CGFloat
    public let itemHeight: CGFloat
    public let itemCornerRadius: CGFloat
    public let itemShadowColor: Color
    public let itemShadowRadius: CGFloat

    public init(
        characterLimitToChangeStackOrientation: Int = 30,
        selectedItemColor: Color = .white,
        selectedItemFont: Font = .callout,
        selectedItemFontWeight: Font.Weight = .regular,
        selectedItemBackgroundColor: Color =  Color(hex: "#0052CC"),
        unselectedItemColor: Color = Color(hex: "#0052CC"),
        unselectedItemFont: Font = .callout,
        unselectedItemFontWeight: Font.Weight = .regular,
        unselectedItemBackgroundColor: Color = .white,
        itemVerticalPadding: CGFloat = 5,
        itemHorizontalPadding: CGFloat = 10,
        itemBorderWidth: CGFloat = 1,
        itemHeight: CGFloat = 32,
        itemCornerRadius: CGFloat = 8,
        itemShadowColor: Color = .white,
        itemShadowRadius: CGFloat = 0
    ) {
        self.characterLimitToChangeStackOrientation = characterLimitToChangeStackOrientation
        self.selectedItemColor = selectedItemColor
        self.selectedItemFont = selectedItemFont
        self.selectedItemFontWeight = selectedItemFontWeight
        self.selectedItemBackgroundColor = selectedItemBackgroundColor
        self.unselectedItemColor = unselectedItemColor
        self.unselectedItemFont = unselectedItemFont
        self.unselectedItemFontWeight = unselectedItemFontWeight
        self.unselectedItemBackgroundColor = unselectedItemBackgroundColor
        self.itemVerticalPadding = itemVerticalPadding
        self.itemHorizontalPadding = itemHorizontalPadding
        self.itemBorderWidth = itemBorderWidth
        self.itemHeight = itemHeight
        self.itemCornerRadius = itemCornerRadius
        self.itemShadowColor = itemShadowColor
        self.itemShadowRadius = itemShadowRadius
    }

}
