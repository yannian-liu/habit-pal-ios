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
    
    static let roundImageButton: Self = .init(
        scriptConfiguration: .init(font: .headline, color: .white, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .paddingDefault, backgroundColor: .navyBlue, shape: .circle, border: nil)
    )
    
    static let selectionButtonActive: Self = .init(
        scriptConfiguration: .init(font: .headline, color: .mediumBlue, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .padding(edgeInsets: .init(top: 4, leading: 4, bottom: 4, trailing: 4)), backgroundColor: .white, shape: .circle, border: .primary)
    )
    
    static let selectionButtonHighlighted: Self = .init(
        scriptConfiguration: .init(font: .headline, color: .white, multilineTextAlignment: .leading),
        plateConfiguration: .init(sizeStyle: .padding(edgeInsets: .init(top: 4, leading: 4, bottom: 4, trailing: 4)), backgroundColor: .navyBlue, shape: .circle, border: .primary)
    )
}
