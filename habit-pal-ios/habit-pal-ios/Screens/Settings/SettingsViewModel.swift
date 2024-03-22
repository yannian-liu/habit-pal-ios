//
//  SettingsViewModel.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 22/3/2024.
//

import Foundation
import Combine
import UIToolbox
import SwiftUI

class SettingsViewModel: ObservableObject {
    @AppStorage(wrappedValue: 0, UserDefaultsKey.appColorScheme) var appColorSchemeRawValue
    var utilities = Utilities()
    
    let themeTitle = TextConfiguration(title: "Color scheme", scriptConfiguration: .header, plateConfiguration: nil)
    
    lazy var themeOptionsView = SingleSelectionOptionViewConfiguration(
        descriptionScriptConfiguration: .body,
        descriptions: AppColorScheme.allCases.map { $0.title },
        buttonContent: Image("tick"),
        unselectedButtonStyle: .selectionButtonActive,
        selectedButtonStyle: .selectionButtonHighlighted,
        animation: .scale,
        direction: .vertical
    )

}

class Utilities {
    @AppStorage(wrappedValue: 0, UserDefaultsKey.appColorScheme) var appColorSchemeRawValue
    var userInterfaceStyle: ColorScheme? = .dark

    func overrideDisplayMode() {
        var userInterfaceStyle: UIUserInterfaceStyle

        if appColorSchemeRawValue == AppColorScheme.dark.rawValue {
            userInterfaceStyle = .dark
        } else if appColorSchemeRawValue == AppColorScheme.light.rawValue {
            userInterfaceStyle = .light
        } else {
            userInterfaceStyle = .unspecified
        }

        UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = userInterfaceStyle
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

extension UIApplication {
    
    var keyWindow: UIWindow? {
        // Get connected scenes
        return self.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
}

extension UIApplication {
    
    var keyWindowPresentedController: UIViewController? {
        var viewController = self.keyWindow?.rootViewController
        
        // If root `UIViewController` is a `UITabBarController`
        if let presentedController = viewController as? UITabBarController {
            // Move to selected `UIViewController`
            viewController = presentedController.selectedViewController
        }
        
        // Go deeper to find the last presented `UIViewController`
        while let presentedController = viewController?.presentedViewController {
            // If root `UIViewController` is a `UITabBarController`
            if let presentedController = presentedController as? UITabBarController {
                // Move to selected `UIViewController`
                viewController = presentedController.selectedViewController
            } else {
                // Otherwise, go deeper
                viewController = presentedController
            }
        }
        
        return viewController
    }
    
}
