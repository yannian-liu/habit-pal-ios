//
//  HabitCellView.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 24/3/2024.
//

import Foundation
import SwiftUI
import UIToolbox

struct HabitCell: View {
    let configuration = HabitCellConfiguration(habit: Habit(id: 001, groupId: 001, title: "water", emoji: "😴", color: Color.red.hex))
    var body: some View {
        VStack {
            StatableButtonView(configuration: configuration.button)
        }
    }
}
