//
//  StatableButtonViewDisplay.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 21/3/2024.
//

import Foundation
import SwiftUI
import UIToolbox

extension StatableButtonViewConfiguration<Image>.Display {
    
    static let primaryRoundImageButton: Self = .init(
        contentConfiguration: .init(font: .headline, color: .buttonPrimaryForeground, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .padding(edgeInsets: .init(top: 12, leading: 12, bottom: 12, trailing: 12)), color: .buttonPrimaryBackground, shape: .circle, border: nil)
    )
    
    static let secondaryRoundImageButton: Self = .init(
        contentConfiguration: .init(font: .headline, color: .buttonSecondaryForeground, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .padding(edgeInsets: .init(top: 12, leading: 12, bottom: 12, trailing: 12)), color: .buttonSecondaryBackground, shape: .circle, border: nil)
    )
    
    static let selectionButtonActive: Self = .init(
        contentConfiguration: .init(font: .headline, color: .clear, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .padding(edgeInsets: .init(top: 4, leading: 4, bottom: 4, trailing: 4)), color: .clear, shape: .circle, border: .primary(.buttonUnselectedBorder))
    )
    
    static let selectionButtonHighlighted: Self = .init(
        contentConfiguration: .init(font: .headline, color: .buttonSelectedForeground, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .padding(edgeInsets: .init(top: 4, leading: 4, bottom: 4, trailing: 4)), color: .buttonSelectedBackground, shape: .circle, border: .primary(.buttonSelectedBackground))
    )
}

extension StatableButtonViewConfiguration<Text>.Display {
    
    static func emojiRoundButtonIncompleted(plateColor: Color) -> Self {
        .init(
            contentConfiguration: .init(font: .headline, color: .white, multilineTextAlignment: .leading),
            plateConfiguration: .init(sizeStyle: .paddingDefault, color: plateColor.opacity(0.2), shape: .circle, border: .primary(plateColor))
        )
    }
}
