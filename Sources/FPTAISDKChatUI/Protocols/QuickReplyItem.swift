//
//  QuickReplyItem.swift
//
//
//
//

import Foundation

/// Represents the data for a quick reply item.
public protocol QuickReplyItem {

    /// Title to be displayed on item
    var title: String { get }

    /// Payload that item contains
    var payload: String { get }
    
    /// URL
    var url: String { get }

}
