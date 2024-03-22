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

    public lazy var todayTextConfiguration = TextConfiguration(title: "Today is 22nd May", scriptConfiguration: .body, plateConfiguration: nil)
    
    public lazy var addButton = StatableButtonViewConfiguration(
        content: Image("appPlus"),
        activeDisplay: .roundImageButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{ [unowned self] in shouldShowAddNewHabitView.toggle() }
    )
    
    public lazy var settingsButton = StatableButtonViewConfiguration(
        content: Image("settings"),
        activeDisplay: .roundImageButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{ [unowned self] in shouldShowSettings = true }
    )

}
