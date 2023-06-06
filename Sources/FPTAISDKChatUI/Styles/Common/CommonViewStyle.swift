//
//  CellContainerStyle.swift
//
//
//
//

import SwiftUI

internal protocol CommonViewStyle {
    var cellBackgroundColor: Color { get }
    var cellCornerRadius: CGFloat { get }
    var cellBorderColor: Color { get }
    var cellBorderWidth: CGFloat { get }
    var cellShadowRadius: CGFloat { get }
    var cellShadowColor: Color { get }
}
