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
    @ObservedObject private var habitsViewModel: HabitsViewModel

    public lazy var navigationConfiguration = NavigationViewConfiguration(title: "Settings") { [unowned self] in
            habitsViewModel.shouldShowSettings = false
    }

    let colorSchemeTitleConfiguration = TextViewConfiguration(title: "Color scheme", contentDisplay: .header, plateDisplay: nil)
    
    lazy var colorSchemeOptionsViewConfiguration = SingleSelectionOptionViewConfiguration(
        descriptionContentDisplay: .body,
        descriptions: AppColorScheme.allCases.map { $0.title },
        buttonContent: Image("tick"),
        unselectedButtonStyle: .selectionButtonActive,
        selectedButtonStyle: .selectionButtonHighlighted,
        animation: .scale,
        direction: .vertical
    )

    init(habitsViewModel: HabitsViewModel) {
        self.habitsViewModel = habitsViewModel
        
        colorSchemeOptionsViewConfiguration.selected = appColorSchemeRawValue
        colorSchemeOptionsViewConfiguration.$selected.compactMap { $0 }.sink { [unowned self] newValue in
            appColorSchemeRawValue = newValue
            utilities.overrideDisplayMode()
        }.store(in: &cancellables)
    }
}
