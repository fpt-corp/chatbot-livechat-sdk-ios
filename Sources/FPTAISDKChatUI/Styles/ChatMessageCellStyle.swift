//
//  MessageCellStyle.swift
//  SwiftyChatbot
//
//
//  Copyright © 2023 All rights reserved.
//

import SwiftUI

// MARK: UI update general
public final class ChatMessageCellStyle: ObservableObject {

    /// Incoming Text Style
    let incomingTextStyle: TextCellStyle

    /// Outgoing Text Style
    let outgoingTextStyle: TextCellStyle

    /// Cell container inset for incoming messages
    let incomingCellEdgeInsets: EdgeInsets

    /// Cell container inset for outgoing messages
    let outgoingCellEdgeInsets: EdgeInsets

    /// Contact Cell Style
    let contactCellStyle: ContactCellStyle

    /// Image Cell Style
    let imageCellStyle: ImageCellStyle

    /// Image and Text Cell Style
    let imageTextCellStyle: ImageTextCellStyle

    /// Quick Reply Cell Style
    let quickReplyCellStyle: QuickReplyCellStyle

    /// Carousel Cell Style
    let carouselCellStyle: CarouselCellStyle

    /// Location Cell Style
    let locationCellStyle: LocationCellStyle

    /// Video Placeholder Cell Style
    let videoPlaceholderCellStyle: VideoPlaceholderCellStyle

    /// Incoming Avatar Style
    let incomingAvatarStyle: AvatarStyle

    /// Outgoing Avatar Style
    let outgoingAvatarStyle: AvatarStyle

    public init(
        // MARK: Bot chat
        incomingTextStyle: TextCellStyle = TextCellStyle(
            textStyle: CommonTextStyle(
                textColor: Color(hex: "#516C95"),
                font: Font.custom("Open Sans", size: 16)
            ),
            cellBackgroundColor: Color(hex: "#EEF3FC")
        ),
        // MARK: Client chat
        outgoingTextStyle: TextCellStyle = TextCellStyle(
            textStyle: CommonTextStyle(
                textColor: .white,
                font: Font.custom("Open Sans", size: 16),
                fontWeight: .bold
            ),
            cellBackgroundColor: Color(hex: "#0052CC")
        ),
        incomingCellEdgeInsets: EdgeInsets = EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
        outgoingCellEdgeInsets: EdgeInsets = EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
        contactCellStyle: ContactCellStyle = ContactCellStyle(),
        imageCellStyle: ImageCellStyle = ImageCellStyle(),
        imageTextCellStyle: ImageTextCellStyle = ImageTextCellStyle(),
        quickReplyCellStyle: QuickReplyCellStyle = QuickReplyCellStyle(),
        carouselCellStyle: CarouselCellStyle = CarouselCellStyle(),
        locationCellStyle: LocationCellStyle = LocationCellStyle(),
        videoPlaceholderCellStyle: VideoPlaceholderCellStyle = VideoPlaceholderCellStyle(),
        incomingAvatarStyle: AvatarStyle = AvatarStyle(),
        outgoingAvatarStyle: AvatarStyle = AvatarStyle(
            imageStyle: CommonImageStyle(imageSize: .zero)
        )
    ) {
        self.incomingTextStyle = incomingTextStyle
        self.outgoingTextStyle = outgoingTextStyle
        self.incomingCellEdgeInsets = incomingCellEdgeInsets
        self.outgoingCellEdgeInsets = outgoingCellEdgeInsets
        self.contactCellStyle = contactCellStyle
        self.imageCellStyle = imageCellStyle
        self.imageTextCellStyle = imageTextCellStyle
        self.quickReplyCellStyle = quickReplyCellStyle
        self.carouselCellStyle = carouselCellStyle
        self.locationCellStyle = locationCellStyle
        self.videoPlaceholderCellStyle = videoPlaceholderCellStyle
        self.incomingAvatarStyle = incomingAvatarStyle
        self.outgoingAvatarStyle = outgoingAvatarStyle

        objectWillChange.send()
    }

}
