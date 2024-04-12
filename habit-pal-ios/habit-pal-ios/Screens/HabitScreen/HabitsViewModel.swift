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
    @Published public var shouldShowAddHabitView = false
    @Published public var shouldShowSettings = false
    @Published public var cellConfigurations = [HabitsTaskCellConfiguration]()
    
    public var todayTextConfiguration = TextViewConfiguration(title: "Today is 22nd May", contentDisplay: .body, plateDisplay: nil)
    
    public lazy var addButton = StatableButtonViewConfiguration.init(
        content: Image("appPlus"),
        activeDisplay: .primaryRoundImageButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{ [unowned self] in shouldShowAddHabitView = true }
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
    
    public let emptyText = TextViewConfiguration(
        title: "You have no habit.\nClick the plus button to add one.",
        contentDisplay: .bodyCentred,
        plateDisplay: nil
    )
    
    @Published var noHabits: Bool!

    private var dataSource: HabitDataSource
    private var subscribes = Set<AnyCancellable>()

    init(dataSource: HabitDataSource = HabitDataSource.shared) {
        self.dataSource = dataSource
        self.dataSource.$habits
            .sink(receiveValue: { [unowned self] habits in
                cellConfigurations = habits.map { habit in
                    HabitsTaskCellConfiguration(habit: habit)
                }
            })
            .store(in: &subscribes)
        
        self.dataSource.$habits
            .sink(receiveValue: { [unowned self] habits in
                noHabits = (habits.count == 0)
            })
            .store(in: &subscribes)
    }
    
    public var settingsViewModel: SettingsViewModel {
        .init(habitsViewModel: self)
    }

    public var addHabitViewModel: AddHabitViewModel {
        .init(habitsViewModel: self)
    }
}
