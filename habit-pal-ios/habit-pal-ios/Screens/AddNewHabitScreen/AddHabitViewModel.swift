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

    public lazy var navigationTitle = TextConfiguration(title: "Add a Habit", contentConfiguration: .navigation, plateConfiguration: nil)
    public lazy var closeButton = StatableButtonViewConfiguration<Image>.closeButton { [unowned self] in
        habitsViewModel.shouldShowAddHabitView = false
    }

    init(habitsViewModel: HabitsViewModel) {
        self.habitsViewModel = habitsViewModel
    }
}
