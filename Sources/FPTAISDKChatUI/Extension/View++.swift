//
//  View++.swift
//  SwiftyChatbot
//

//  Copyright © 2023 All rights reserved.
//

import SwiftUI

internal extension View {

    func keyboardAwarePadding() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAwareModifier())
    }

}
