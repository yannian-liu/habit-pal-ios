//
//  TextConfiguration+App.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 22/3/2024.
//

import Foundation
import UIToolbox

extension ScriptConfiguration {
    static let header: Self = .init(font: .custom(.FontName.avenirHeavy, size: 17), color: .textPrimary, multilineTextAlignment: .leading)
    static let body: Self = .init(font: .custom(.FontName.avenirMedium, size: 16), color: .textPrimary, multilineTextAlignment: .leading)
    static let lightBody: Self = .init(font: .custom(.FontName.avenirLight, size: 14), color: .textPrimary, multilineTextAlignment: .leading)
}
