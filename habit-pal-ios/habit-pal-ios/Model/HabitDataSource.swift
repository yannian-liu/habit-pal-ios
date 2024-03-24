//
//  HabitDataSource.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 25/3/2024.
//

import Foundation
import Combine
import SwiftData

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
