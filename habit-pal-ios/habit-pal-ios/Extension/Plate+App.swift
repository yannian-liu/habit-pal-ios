//
//  Plate+App.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 25/3/2024.
//

import Foundation
import UIToolbox
import SwiftUI

extension PlateConfiguration {
    static let card: Self = .init(
        sizeStyle: .paddingDefault,
        color: .cardBackground,
        shape: .rectangle(cornerRadius: 15),
        border: nil
    )
    
    static func emojiIncompleted(plateColor: Color) -> Self {
        .init(sizeStyle: .paddingDefault, color: plateColor.opacity(0.2), shape: .circle, border: .primary(plateColor))
    }
    
    static func emojiCompleted(plateColor: Color) -> Self {
        .init(sizeStyle: .paddingDefault, color: plateColor, shape: .circle, border: .primary(plateColor))
    }

}
