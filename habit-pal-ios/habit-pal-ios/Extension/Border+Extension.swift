//
//  Border+Extension.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 21/3/2024.
//

import Foundation
import SwiftUI
import UIToolbox

extension PlateDisplay.Border {
    
    static let primary: Self = .primary(.buttonPrimaryBackground)
    
    static func primary(_ color: Color) -> Self { .init(width: 1.5, dash: [], color: color, gap: 0) }
}
