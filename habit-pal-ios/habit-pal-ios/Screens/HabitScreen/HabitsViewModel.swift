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
    @Published public var habitConfigurations = [HabitCellConfiguration]()
    
    public var todayTextConfiguration = TextConfiguration(title: "Today is 22nd May", contentConfiguration: .body, plateConfiguration: nil)
    
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
    
    public let emptyText = TextConfiguration(
        title: "You have no habit.\nClick the plus button to add one.",
        contentConfiguration: .bodyCentred,
        plateConfiguration: nil
    )
    
    @Published var noHabits: Bool!

    private var dataSource: HabitDataSource
    private var subscribes = Set<AnyCancellable>()

    init(dataSource: HabitDataSource = HabitDataSource.shared) {
        self.dataSource = dataSource
        self.dataSource.$habits
            .sink(receiveValue: { [unowned self] habits in
                habitConfigurations = habits.map { habit in
                    HabitCellConfiguration(habit: habit)
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
