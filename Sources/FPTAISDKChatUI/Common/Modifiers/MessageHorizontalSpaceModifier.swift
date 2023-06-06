//
//  MessageModifier.swift
//  SwiftyChatbot
//

//  Copyright © 2023 All rights reserved.
//

import SwiftUI

internal struct MessageHorizontalSpaceModifier: ViewModifier {

    public var messageKind: ChatMessageKind
    public var isSender: Bool

    private var isSpaceFreeMessageKind: Bool {
        if case ChatMessageKind.carousel = messageKind {
            return true
        }
        return false
    }

    public func body(content: Content) -> some View {
        HStack(spacing: 0) {
            if isSender {
                Spacer(minLength: 10)
            }
            content
            if !isSender && !isSpaceFreeMessageKind {
                Spacer(minLength: 10)
            }
        }
    }
}
