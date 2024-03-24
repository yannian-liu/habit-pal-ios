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

    init(habitsViewModel: HabitsViewModel) {
        self.habitsViewModel = habitsViewModel
    }
}
