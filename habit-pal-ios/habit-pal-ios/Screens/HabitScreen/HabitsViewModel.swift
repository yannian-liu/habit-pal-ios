//
//  HabitsViewModel.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 21/3/2024.
//

import Foundation
import Combine
import UIToolbox
import SwiftUI

class HabitsViewModel: ObservableObject {
    @Published public var shouldShowAddNewHabitView = false
    @Published public var shouldShowSettings = false

    public lazy var todayTextConfiguration = TextConfiguration(title: "Today is 22nd May", contentConfiguration: .body, plateConfiguration: nil)
    
    public lazy var addButton = StatableButtonViewConfiguration(
        content: Image("appPlus"),
        activeDisplay: .primaryRoundImageButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{ [unowned self] in shouldShowAddNewHabitView.toggle() }
    )
    
    public lazy var settingsButton = StatableButtonViewConfiguration(
        content: Image("settings"),
        activeDisplay: .primaryRoundImageButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{ [unowned self] in shouldShowSettings = true }
    )

    var settingsViewModel: SettingsViewModel {
        .init(habitsViewModel: self)
    }
}
