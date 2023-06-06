//
//  ChatMessage.swift
//  SwiftyChatbot
//
//
//  Copyright © 2023 All rights reserved.
//

import Foundation

public protocol ChatMessage: Identifiable {

    associatedtype User: ChatUser
    /// The `User` who sent this message.
    var user: User { get }

    /// Type of message
    var messageKind: ChatMessageKind { get }

    /// To determine if user is the current user to properly align UI.
    var isSender: Bool { get }

    /// The date message sent.
    var date: Date { get }

}