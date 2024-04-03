//
//  AddNewHabitViewModel.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 21/3/2024.
//

import Foundation
import UIToolbox
import Combine
import SwiftUI

class AddHabitViewModel: ObservableObject {
    @ObservedObject private var habitsViewModel: HabitsViewModel

    public lazy var navigationConfiguration = NavigationViewConfiguration(title: "Add a Habit") { [unowned self] in
            habitsViewModel.shouldShowAddHabitView = false
    }
    
    public lazy var emojiConfiguration = OneCharTextFieldViewConfiguration(
        contentDisplay: .emoji,
        plateDisplay: .emojiCompleted(plateColor: .red),
        accentColor: .clear,
        isSelectionDisabled: true,
        keepPrefixWhenTypeOnFull: false,
        statePublisher: nil,
        tag: 0
    )
    
    lazy var button = StatableButtonViewConfiguration(
        content: Text("?"),
        activeDisplay: .emojiRoundButtonCompleted(plateColor: .blue),
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action: { [unowned self] in
            emojiConfiguration.textFieldViewConfiguration.becomeFocus()
        }
    )

    init(habitsViewModel: HabitsViewModel) {
        self.habitsViewModel = habitsViewModel
    }
}
