//
//  HabitCellConfiguration.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 24/3/2024.
//

import Foundation
import UIToolbox
import SwiftUI

class HabitsTaskCellConfiguration {
    
    private(set) var habit: Habit
    @Published private var isCompletedToday: Bool

    lazy var button = StatableButtonViewConfiguration(
        content: Text(habit.emoji.emoji),
        activeDisplay: .emojiIncompleted(plateColor: .init(hex: habit.color)),
        disabledDisplay: nil,
        highlightedDisplay: .emojiCompleted(plateColor: .init(hex: habit.color)),
        animation: .scale,
        statePublisher: $isCompletedToday.map { $0 ? .highlighted : .active }.eraseToAnyPublisher(),
        action: { [unowned self] in
            habit.toggleComplete()
            isCompletedToday = habit.isCompletedToday
            Haptics.shared.play(.heavy)
        }
    )
    
    lazy var text = TextViewConfiguration(
        title: habit.title,
        contentDisplay: .detail,
        plateDisplay: nil
    )
    
    init(habit: Habit) {
        self.habit = habit
        isCompletedToday = habit.isCompletedToday
    }
    
    
}

extension HabitsTaskCellConfiguration: Hashable {
    var identifier: String {
        return String(habit.id)
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
    
    static func == (lhs: HabitsTaskCellConfiguration, rhs: HabitsTaskCellConfiguration) -> Bool {
        lhs.habit.id == rhs.habit.id
    }
    
    
}
