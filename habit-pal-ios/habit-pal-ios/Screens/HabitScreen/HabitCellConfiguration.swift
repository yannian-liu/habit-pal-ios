//
//  HabitCellConfiguration.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 24/3/2024.
//

import Foundation
import UIToolbox
import SwiftUI

class HabitCellConfiguration {
    
    private let habit: Habit
    
    lazy var button = StatableButtonViewConfiguration(
        content: Text(habit.emoji.emoji),
        activeDisplay: .emojiRoundButtonIncompleted(plateColor: .init(hex: habit.color)),
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action: { }
    )
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    
}
