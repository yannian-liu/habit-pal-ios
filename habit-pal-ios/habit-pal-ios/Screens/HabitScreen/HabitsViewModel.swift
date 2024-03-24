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
import SwiftData

class HabitsViewModel: ObservableObject {
    @Published public var shouldShowAddNewHabitView = false
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
        action:{ [unowned self] in dataSource.addHabit(.init(id: Int.random(in: 0...999999), groupId: 001, title: "this is a really long title let take a loooooooook", emoji: "☎️", color: Color.blue.hex))}
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

}

class MockData {
    let habits = [
        Habit(id: 001, groupId: 001, title: "Water", emoji: "💧".code, color: Color.blue.hex),
        Habit(id: 002, groupId: 001, title: "Milk", emoji: "🍼".code, color: Color.yellow.hex),
        Habit(id: 003, groupId: 002, title: "Cereal", emoji: "🍚".code, color: Color.red.hex),
    ]
    
    let groups = [
        Group(id: 001, title: "Morning"),
        Group(id: 002, title: "Afternoon"),
    ]
}


final class HabitDataSource: ObservableObject {
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @Published var habits: [Habit] = []
    
    @MainActor
    static let shared = HabitDataSource()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Habit.self)
        self.modelContext = modelContainer.mainContext
        
        habits = fetchHabits()
    }

    func addHabit(_ habit: Habit) {
        modelContext.insert(habit)
        do {
            try modelContext.save()
            habits = fetchHabits()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func fetchHabits() -> [Habit] {
        do {
            return try modelContext.fetch(FetchDescriptor<Habit>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func removeHabit(_ habit: Habit) {
        modelContext.delete(habit)
        habits = fetchHabits()
    }
    
}
