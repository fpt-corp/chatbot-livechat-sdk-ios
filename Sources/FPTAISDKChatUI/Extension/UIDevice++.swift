//
//  UIDevice++.swift
//  SwiftyChatbot
//
//
//  Copyright © 2023 All rights reserved.
//

import UIKit

public extension UIDevice {

    static var isLandscape: Bool {
        return UIDevice.current.orientation == .landscapeLeft ||
            UIDevice.current.orientation == .landscapeRight
    }

    static var isPortrait: Bool {
        return UIDevice.current.orientation == .portrait ||
            UIDevice.current.orientation == .portraitUpsideDown
    }

}
