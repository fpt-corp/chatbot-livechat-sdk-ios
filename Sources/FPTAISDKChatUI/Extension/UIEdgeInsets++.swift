//
//  UIEdgeInsets.swift
//
//
//
//

import UIKit

internal extension UIEdgeInsets {

    var vertical: CGFloat {
        return top + bottom
    }

    var horizontal: CGFloat {
        return left + right
    }

}
