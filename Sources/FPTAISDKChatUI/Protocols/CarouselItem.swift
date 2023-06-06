//
//  CarouselItem.swift
//
//
//
//

import Foundation

/// Represents the data for a contact.
public protocol CarouselItem {

    /// Image automatically scalesToFit itself in a given available width
    var imageURL: URL? { get }

    /// Multiline title
    var title: String { get }

    /// Multiline subtitle
    var subtitle: String { get }

    /// Action buttons to be aware of when tapped. (view ChatView.onCarouselItemAction)
    var buttons: [CarouselItemButton] { get }

}
