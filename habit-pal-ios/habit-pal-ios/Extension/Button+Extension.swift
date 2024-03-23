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
        scriptConfiguration: .init(font: .headline, color: .buttonPrimaryForeground, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .padding(edgeInsets: .init(top: 10, leading: 10, bottom: 10, trailing: 10)), backgroundColor: .buttonPrimaryBackground, shape: .circle, border: nil)
    )
    
    static let secondaryRoundImageButton: Self = .init(
        scriptConfiguration: .init(font: .headline, color: .buttonSecondaryForeground, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .padding(edgeInsets: .init(top: 10, leading: 10, bottom: 10, trailing: 10)), backgroundColor: .buttonSecondaryBackground, shape: .circle, border: nil)
    )
    
    static let selectionButtonActive: Self = .init(
        scriptConfiguration: .init(font: .headline, color: .clear, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .padding(edgeInsets: .init(top: 4, leading: 4, bottom: 4, trailing: 4)), backgroundColor: .clear, shape: .circle, border: .init(width: 1, dash: [], color: .buttonUnselectedBorder, gap: 0))
    )
    
    static let selectionButtonHighlighted: Self = .init(
        scriptConfiguration: .init(font: .headline, color: .buttonSelectedForeground, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .padding(edgeInsets: .init(top: 4, leading: 4, bottom: 4, trailing: 4)), backgroundColor: .buttonSelectedBackground, shape: .circle, border: .init(width: 1, dash: [], color: .buttonSelectedBackground, gap: 0))
    )
}
