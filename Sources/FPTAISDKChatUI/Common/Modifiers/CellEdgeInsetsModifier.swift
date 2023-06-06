//
//  CellEdgeInsetsModifier.swift
//
//
//
//

import SwiftUI

internal struct CellEdgeInsetsModifier: ViewModifier {

    public let isSender: Bool
    @EnvironmentObject var style: ChatMessageCellStyle

    private var insets: EdgeInsets {
        isSender ? style.outgoingCellEdgeInsets : style.incomingCellEdgeInsets
    }

    public func body(content: Content) -> some View {
        content.padding(insets)
    }

}
