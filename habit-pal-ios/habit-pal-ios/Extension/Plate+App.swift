//
//  Plate+App.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 25/3/2024.
//

import Foundation
import UIToolbox
import SwiftUI

extension PlateDisplay {
    static let card: Self = .init(
        sizeStyle: .paddingDefault,
        color: .cardBackground,
        shape: .rectangle(cornerRadius: 15),
        border: nil
    )
    
    static func emojiIncompleted(plateColor: Color) -> Self {
        .init(sizeStyle: .paddingDefault, color: plateColor.opacity(0.2), shape: .circle, border: .thin(plateColor))
    }
    
    static func emojiCompleted(plateColor: Color) -> Self {
        .init(sizeStyle: .paddingDefault, color: plateColor, shape: .circle, border: .thin(plateColor))
    }

    static func emojiForDetail(plateColor: Color) -> Self {
        .init(sizeStyle: .padding(edgeInsets: .init(top: 16, leading: 16, bottom: 16, trailing: 16)), color: plateColor, shape: .circle, border: .primary(plateColor))
    }
    
    static let input: Self =
        .init(sizeStyle: .padding(edgeInsets: .init(top: 12, leading: 12, bottom: 12, trailing: 12)), color: .cardBackground, shape: .rectangle(cornerRadius: 15), border: .primary(.buttonSecondaryBackground))

}
