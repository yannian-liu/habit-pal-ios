//
//  ColorScheme.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 23/3/2024.
//

import Foundation
import SwiftUI

class Utilities {
    @AppStorage(wrappedValue: 0, UserDefaultsKey.appColorScheme) var appColorSchemeRawValue

    func overrideDisplayMode() {
        var userInterfaceStyle: UIUserInterfaceStyle
        
        if appColorSchemeRawValue == AppColorScheme.dark.rawValue {
            userInterfaceStyle = .dark
        } else if appColorSchemeRawValue == AppColorScheme.light.rawValue {
            userInterfaceStyle = .light
        } else {
            userInterfaceStyle = .unspecified
        }

        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = userInterfaceStyle
    }
}

enum AppColorScheme: Int, CaseIterable {
    case auto = 0, light, dark

    init(code: Int) {
        self = AppColorScheme(rawValue: code) ?? .auto
    }

    var title: String {
        switch self {
        case .auto: return "Use device theme"
        case .light: return "Light theme"
        case .dark: return "Dark theme"
        }
    }
}

enum UserDefaultsKey {
    static let appColorScheme = "appColorScheme"
}
