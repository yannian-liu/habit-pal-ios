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
    
    public lazy var todayTextConfiguration = TextConfiguration(title: "Today is 22nd May", scriptConfiguration: .init(font: .custom(.FontName.avenirMedium, size: 16), color: .navyBlue, multilineTextAlignment: .leading), frameConfiguration: nil)
    
    public lazy var addButton = StatableButtonViewConfiguration(
        content: Image("appPlus"),
        activeDisplay: .roundImageButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{ [unowned self] in shouldShowAddNewHabitView.toggle() }
    )
    
    public let settingsButton = StatableButtonViewConfiguration(
        content: Image("settings"),
        activeDisplay: .roundImageButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{}
    )

}
