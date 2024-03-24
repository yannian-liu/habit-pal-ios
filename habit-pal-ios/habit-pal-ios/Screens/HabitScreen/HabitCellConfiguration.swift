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
    
    private(set) var habit: Habit
    
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

extension HabitCellConfiguration: Hashable {
    var identifier: String {
        return String(habit.id)
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
    
    static func == (lhs: HabitCellConfiguration, rhs: HabitCellConfiguration) -> Bool {
        lhs.habit.id == rhs.habit.id
    }
    
    
}
