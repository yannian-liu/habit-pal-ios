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
    
    public lazy var emojiTextField = OneCharTextFieldViewConfiguration(
        contentDisplay: .emoji,
        plateDisplay: .emojiForDetail(plateColor: .red),
        accentColor: .clear,
        isSelectionDisabled: true,
        keepPrefixWhenTypeOnFull: false,
        statePublisher: nil,
        tag: 0
    )
        
    lazy var emojiButton = StatableButtonViewConfiguration(
        content: Text("💧"),
        activeDisplay: .emojiForDetail(plateColor: .blue),
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action: { [unowned self] in
            emojiTextField.textFieldViewConfiguration.becomeFocus()
        }
    )

    init(habitsViewModel: HabitsViewModel) {
        self.habitsViewModel = habitsViewModel
        
    }
}
