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
    @Published private var isCompletedToday: Bool

    lazy var button = StatableButtonViewConfiguration(
        content: Text(habit.emoji.emoji),
        activeDisplay: .emojiRoundButtonIncompleted(plateColor: .init(hex: habit.color)),
        disabledDisplay: nil,
        highlightedDisplay: .emojiRoundButtonCompleted(plateColor: .init(hex: habit.color)),
        animation: .scale,
        statePublisher: $isCompletedToday.map { $0 ? .highlighted : .active }.eraseToAnyPublisher(),
        action: { [unowned self] in
            habit.toggleComplete()
            isCompletedToday = habit.isCompletedToday
        }
    )
    
    lazy var text = TextConfiguration(
        title: habit.title,
        contentConfiguration: .detail,
        plateConfiguration: nil
    )
    
    init(habit: Habit) {
        self.habit = habit
        isCompletedToday = habit.isCompletedToday
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
