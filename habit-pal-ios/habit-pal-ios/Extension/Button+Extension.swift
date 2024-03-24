//
//  Button+Extension.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 25/3/2024.
//

import Foundation
import SwiftUI
import UIToolbox

extension StatableButtonViewConfiguration<Image> {
    
    static func closeButton(_ action: @escaping () -> Void) -> StatableButtonViewConfiguration<Image> {
        .init(
            content: Image("cross"),
            activeDisplay: .secondaryRoundImageButton,
            disabledDisplay: nil,
            highlightedDisplay: nil,
            animation: .scale,
            statePublisher: nil,
            action: action
        )

    }
    
}
