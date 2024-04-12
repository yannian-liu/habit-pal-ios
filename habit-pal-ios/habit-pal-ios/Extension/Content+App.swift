//
//  TextConfiguration+App.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 22/3/2024.
//

import Foundation
import UIToolbox

extension ContentDisplay {
    static let navigation: Self = .init(font: .custom(.FontName.avenirBlack, size: 17), color: .textPrimary, multilineTextAlignment: .leading)
    static let header: Self = .init(font: .custom(.FontName.avenirHeavy, size: 16), color: .textPrimary, multilineTextAlignment: .leading)
    static let headerCentred: Self = .init(font: .custom(.FontName.avenirHeavy, size: 16), color: .textPrimary, multilineTextAlignment: .center)
    static let body: Self = .init(font: .custom(.FontName.avenirMedium, size: 16), color: .textPrimary, multilineTextAlignment: .leading)
    static let bodyCentred: Self = .init(font: .custom(.FontName.avenirMedium, size: 16), color: .textPrimary, multilineTextAlignment: .center)
    static let detail: Self = .init(font: .custom(.FontName.avenirBook, size: 14), color: .textPrimary, multilineTextAlignment: .leading)
    static let emoji: Self = .init(font: .body, color: .white, multilineTextAlignment: .center)
    static let emojiForDetail: Self = .init(font: .title, color: .white, multilineTextAlignment: .center)

}
