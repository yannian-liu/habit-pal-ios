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
    private var cancellables = Set<AnyCancellable>()

    public lazy var navigationTitle = TextConfiguration(title: "Settings", scriptConfiguration: .navigation, plateConfiguration: nil)
    public lazy var closeButton = StatableButtonViewConfiguration(
        content: Image("settings"),
        activeDisplay: .secondaryRoundImageButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{ }
    )
    
    let colorSchemeTitleConfiguration = TextConfiguration(title: "Color scheme", scriptConfiguration: .header, plateConfiguration: nil)
    
    lazy var colorSchemeOptionsViewConfiguration = SingleSelectionOptionViewConfiguration(
        descriptionScriptConfiguration: .body,
        descriptions: AppColorScheme.allCases.map { $0.title },
        buttonContent: Image("tick"),
        unselectedButtonStyle: .selectionButtonActive,
        selectedButtonStyle: .selectionButtonHighlighted,
        animation: .scale,
        direction: .vertical
    )

    init() {
        colorSchemeOptionsViewConfiguration.selected = appColorSchemeRawValue
        colorSchemeOptionsViewConfiguration.$selected.compactMap { $0 }.sink { [unowned self] newValue in
            appColorSchemeRawValue = newValue
            utilities.overrideDisplayMode()
        }.store(in: &cancellables)
    }
}
