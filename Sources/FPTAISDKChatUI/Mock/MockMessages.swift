//
//  MockMessages.swift
//  SwiftyChatbot
//

//  Copyright © 2023 All rights reserved.
//

import UIKit
import Foundation

internal extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

public struct MockMessages {
    
    public enum Kind {
        case Text
        case Image
        case Location
        case Contact
        case QuickReply
        case Carousel
        case Video
        case Custom

        private var messageKind: ChatMessageKind {
            switch self {
            case .Text: return .text("")
            case .Image: return .image(.remote(URL(string: "")!))
            case .Location: return .location(LocationRow(latitude: .nan, longitude: .nan))
            case .Contact: return .contact(ContactRow(displayName: ""))
            case .QuickReply: return .quickReply([])
            case .Carousel: return .carousel([CarouselRow(title: "", imageURL: nil, subtitle: "", buttons: [])])
            case .Video: return .video(VideoRow(url: URL(string: "")!, placeholderImage: .remote(URL(string: "")!), pictureInPicturePlayingMessage: ""))
            case .Custom: return .custom("")
            }
        }
    }

    // MARK: - Concrete model for Location
    private struct LocationRow: LocationItem {
        var latitude: Double
        var longitude: Double
    }

    // MARK: - Concrete model for Contact
    private struct ContactRow: ContactItem {
        var displayName: String
        var image: UIImage?
        var initials: String = ""
        var phoneNumbers: [String] = []
        var emails: [String] = []
    }

    // MARK: - Concrete model for QuickReply
    private struct QuickReplyRow: QuickReplyItem {
        var title: String
        var payload: String
        var url: String
    }

    // MARK: - Concrete model for Carousel
    private struct CarouselRow: CarouselItem {
        var title: String
        var imageURL: URL?
        var subtitle: String
        var buttons: [CarouselItemButton]
    }

    // MARK: - Concrete model for Video
    private struct VideoRow: VideoItem {
        var url: URL
        var placeholderImage: ImageLoadingKind
        var pictureInPicturePlayingMessage: String
    }

    // MARK: - Concrete model for ChatMessage
    public struct ChatMessageItem: ChatMessage {

        public let id = UUID()
        public var user: ChatUserItem
        public var messageKind: ChatMessageKind
        public var isSender: Bool
        public var date: Date

        public init(
            user: ChatUserItem,
            messageKind: ChatMessageKind,
            isSender: Bool = false,
            date: Date = .init()
        ) {
            self.user = user
            self.messageKind = messageKind
            self.isSender = isSender
            self.date = date
        }
        
    }

    // MARK: - Concrete model for ChatUser
    public struct ChatUserItem: ChatUser {

        public static func == (lhs: ChatUserItem, rhs: ChatUserItem) -> Bool {
            lhs.id == rhs.id
        }

        public let id = UUID().uuidString

        /// Username
        public var userName: String

        /// User's chat profile image, considered if `avatarURL` is nil
        public var avatar: UIImage?

        /// User's chat profile image URL
        public var avatarURL: URL?

        public init(userName: String, avatarURL: URL? = nil, avatar: UIImage? = nil) {
            self.userName = userName
            self.avatar = avatar
            self.avatarURL = avatarURL
        }

    }

    public static var sender: ChatUserItem = .init(
        userName: "Sender",
        avatar:  UIImage(named: "bot_chat_icon", in: Bundle(identifier: "fpt.ai.fptaichatbotsdk"), with: nil)
    )

    public static var chatbot: ChatUserItem = .init(
        userName: "Chatbot",
        avatar: UIImage(named: "bot_chat_icon", in: Bundle(identifier: "fpt.ai.fptaichatbotsdk"), with: nil)
    )

    private static var randomUser: ChatUserItem {
        [sender, chatbot].randomElement()!
    }

    public static var mockImages: [UIImage] = []

    public static func generateMessage(kind: MockMessages.Kind, count: UInt) -> [ChatMessageItem] {
        (1...count).map { _ in generateMessage(kind: kind) }
    }

    public static func generateMessage(kind: MockMessages.Kind) -> ChatMessageItem {
        let randomUser = Self.randomUser
        switch kind {

        case .Image:
            guard let url = URL(string: "https://picsum.photos/id/\(Int.random(in: 1...100))/400/300") else { fallthrough }
            return ChatMessageItem(
                user: randomUser,
                messageKind: .image(.remote(url)),
                isSender: randomUser == Self.sender
            )

        case .Text:
            return ChatMessageItem(
                user: randomUser,
                messageKind: .text(Lorem.sentence()),
                isSender: randomUser == Self.sender
            )

        case .Carousel:
            return ChatMessageItem(
                user: Self.chatbot,
                messageKind: .carousel([
                    CarouselRow(
                        title: "Multiline Title",
//                        imageURL: URL(string:"https://picsum.photos/400/300"),
                        imageURL: URL(string: "https://picsum.photos/id/1/400/200"),
                        subtitle: "Multiline Subtitle, you do not believe me ?",
                        buttons: [
                            CarouselItemButton(title: "Action Button", url: "Action Button", payload: "Action Button")
                        ]
                    ),
                    CarouselRow(
                        title: "This one is really multiline",
//                        imageURL: URL(string:"https://picsum.photos/400/300"),
                        imageURL: URL(string: "https://picsum.photos/id/2/400/200"),
                        subtitle: "Multilinable Subtitle",
                        buttons: [
                            CarouselItemButton(title: "Tap me!", url: "", payload: "")
                        ]
                    )
                ]),
                isSender: false
            )

        case .QuickReply:
            let quickReplies: [QuickReplyRow] = (1...Int.random(in: 2...4)).map { idx in
                return QuickReplyRow(title: "Option.\(idx)", payload: "opt\(idx)", url: "")
            }
            return ChatMessageItem(
                user: randomUser,
                messageKind: .quickReply(quickReplies),
                isSender: randomUser == Self.sender
            )

        case .Location:
            let location = LocationRow(
                latitude: Double.random(in: 36...42),
                longitude: Double.random(in: 26...45)
            )
            return ChatMessageItem(
                user: randomUser,
                messageKind: .location(location),
                isSender: randomUser == Self.sender
            )

        case .Contact:
            let contacts = [
                ContactRow(displayName: "Enes Karaosman"),
                ContactRow(displayName: "Adam Surname"),
                ContactRow(displayName: "Name DummySurname")
            ]
            return ChatMessageItem(
                user: randomUser,
                messageKind: .contact(contacts.randomElement()!),
                isSender: randomUser == Self.sender
            )

        case .Video:
            let videoItem = VideoRow(
                url: URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!,
                placeholderImage: .remote(URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg")!),
                pictureInPicturePlayingMessage: "This video is playing in picture in picture."
            )
            return ChatMessageItem(
                user: randomUser,
                messageKind: .video(videoItem),
                isSender: randomUser == Self.sender
            )
        case .Custom:
            return ChatMessageItem(
                user: randomUser,
                messageKind: .custom(Lorem.sentence()),
                isSender: randomUser == Self.sender
            )

        }
    }

    public static var randomMessageKind: MockMessages.Kind {
        let allCases: [MockMessages.Kind] = [
            .Image,
            .Text, .Text, .Text,
            .Contact,
            .Text, .Text, .Text,
            .Carousel,
            .Location,
            .Text, .Text, .Text,
            .Video,
            .QuickReply,
            .Custom
        ]
        return allCases.randomElement()!
    }

    public static func generatedMessages(count: Int = 30) -> [ChatMessageItem] {
        return (1...count).map { _ in generateMessage(kind: randomMessageKind)}
    }
    
    // MARK: - Show display from chat logs for MessagesView
    public static func generatedMessageFromHttpResponse(data: Any?) -> [ChatMessageItem] {

        func convertStringToDictionary(text: String) -> [String:String]? {
            if let data = text.data(using: .utf8) {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:String]
                    return json
                } catch {
                    //print("Something went wrong")
                }
            }
            return nil
        }
        
        var logs: [ChatMessageItem]  = []
        let dataConverted = data as? [String:Any]
        if dataConverted?["chatlog"] != nil {
            let chatLogs: NSArray = dataConverted!["chatlog"] as! NSArray
            for chatLog in chatLogs {
                let chatLogConverted = chatLog as? [String:Any]
                
                let source: Int = chatLogConverted?["source"] as! Int
                let typeDisplay: String = chatLogConverted?["message_type"]  as! String
                var _sender = Self.chatbot
                if source == 1 {
                    _sender = Self.sender
                }
                
                if chatLogConverted?["message"] != nil {
                    let singleMessage = "\((chatLogConverted?["message"]!)!)"
                    let data = Data(singleMessage.utf8)
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            if json["type"] as! String == "file" {
                                let stringFile = json["content"] as! String
                                let contentFileFromServer = convertStringToDictionary(text: stringFile)
                                logs.insert(contentsOf: self.dislayOnMessageView(typeDisplay: "image", contentDisplay: contentFileFromServer!, _sender:_sender), at: 0)
                                
                            } else {
                                var contentDisplay = json["content"] as! [String:Any]
                                if source == 1 {
                                    if contentDisplay["text"]  != nil {
                                        let saparatedText = (contentDisplay["text"] as! String).components(separatedBy: "#")
                                        if saparatedText.count >= 3 {
                                            var reformatText: String = "\(saparatedText[saparatedText.count - 1])"
                                            if let i = reformatText.firstIndex(of: "#") {
                                                reformatText.remove(at: i)
                                            }
                                            contentDisplay["text"] = reformatText
                                        }
                                    }
                                }
                                if contentDisplay["text"]  != nil || contentDisplay["buttons"] != nil || contentDisplay["carousel_cards"] != nil {
                                    logs.insert(contentsOf: self.dislayOnMessageView(typeDisplay: typeDisplay, contentDisplay:contentDisplay, _sender:_sender), at: 0)
                                }
                            }
                        }
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                }
            }
        }
       
        return logs
    }
    
    // MARK: - Show display from socket for MessagesView
    public static func generatedMessageFromSocketResponse(data: Any?) -> [ChatMessageItem] {
        if data != nil {
            let dataConverted = data as? [String:Any]
            let source: Int = dataConverted?["source"] as! Int
            let typeDisplay: String = dataConverted?["type"]  as! String
            let contentDisplay = dataConverted?["content"] as! [String:Any]
            
            if source == 2 {
                return self.dislayOnMessageView(typeDisplay: typeDisplay, contentDisplay:contentDisplay, _sender:Self.chatbot)
            }
        }
       return []
    }
    
    public static func dislayOnMessageView(typeDisplay: String, contentDisplay:[String:Any], _sender:ChatUserItem) -> [ChatMessageItem] {
        switch typeDisplay {
        case "text":
            let buttons = contentDisplay["buttons"]
            if buttons == nil {
                return [ChatMessageItem(
                    user: _sender,
                    messageKind: .text("\(contentDisplay["text"]!)"),
                    isSender: _sender == Self.sender
                )]
            } else {
                var quickReplies: [QuickReplyRow] = []
                for itemButton in contentDisplay["buttons"] as! NSArray {
                    let values = itemButton as! [String:String]
                    let addMoreToPayload = "\(values["payload"] ?? "")" + "#" + "\(values["title"] ?? "")"
                    quickReplies.append(
                        QuickReplyRow(title: "\(values["title"] ?? "")", payload: addMoreToPayload, url: "\(values["url"] ?? "")")
                    )
                }
                
                return [
                    ChatMessageItem(
                        user: _sender,
                        messageKind: .text("\(contentDisplay["text"]!)"),
                        isSender: _sender == Self.sender
                    ),
                    ChatMessageItem(
                        user: _sender,
                        messageKind: .quickReply(quickReplies),
                        isSender: _sender == Self.sender
                    )
                ]
            }
            
           
        case "image":
            guard let url = URL(string: "\(contentDisplay["url"]!)" ) else { fallthrough }
            return [ChatMessageItem(
                user: _sender,
                messageKind: .image(.remote(url)),
                isSender: _sender == Self.sender
            )]
        case "carousel":
            var carousel: [CarouselItem] = []
            let carouselCards = contentDisplay["carousel_cards"] as! NSArray
            for card in carouselCards {
                let valueCard = card as! [String:Any]
                
                guard let url = URL(string: "\(valueCard["image_url"]!)" ) else { fallthrough }
                let valueCardButtons = valueCard["buttons"] as! NSArray
                var carouselItemButton: [CarouselItemButton] = []
                for itemButton in valueCardButtons {
                    let values = itemButton as! [String:String]
                    let addMoreToPayload = "\(values["payload"] ?? "")" + "#" + "\(values["title"] ?? "")"
                    carouselItemButton.append(
                        CarouselItemButton(title: "\(values["title"] ?? "")", url: "\(values["url"] ?? "")", payload: addMoreToPayload)
                    )
                }
                carousel.append(
                    CarouselRow(
                        title: "\(valueCard["title"]!)",
                        imageURL: url,
                        subtitle: "\(valueCard["subtitle"]!)",
                        buttons: carouselItemButton
                    )
                )
            }
            
            return [ChatMessageItem(
                user: _sender,
                messageKind: .carousel(carousel),
                isSender: _sender == Self.sender
            )]
        case "quick_reply":
            var quickReplies: [QuickReplyRow] = []
            for itemButton in contentDisplay["buttons"] as! NSArray {
                let values = itemButton as! [String:String]
                let addMoreToPayload = "\(values["payload"] ?? "")" + "#" + "\(values["title"] ?? "")"
                quickReplies.append(
                    QuickReplyRow(title: "\(values["title"] ?? "")", payload: addMoreToPayload, url: "\(values["url"] ?? "")")
                )
            }
        
            return [
                ChatMessageItem(
                    user: _sender,
                    messageKind: .text("\(contentDisplay["text"]!)"),
                    isSender: _sender == Self.sender
                ),
                ChatMessageItem(
                    user: _sender,
                    messageKind: .quickReply(quickReplies),
                    isSender: _sender == Self.sender
                )
            ]
        case "typing":
            return []
        default:
            print("loai moi >>>>")
            print(typeDisplay)
            print(contentDisplay)
            return []
        }
    }
    
   
}
