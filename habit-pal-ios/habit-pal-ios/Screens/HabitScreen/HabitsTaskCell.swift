//
//  HabitCellView.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 24/3/2024.
//

import Foundation
import SwiftUI
import UIToolbox

struct HabitsTaskCell: View {
    
    let configuration: HabitsTaskCellConfiguration
    
    var body: some View {
        VStack {
            StatableButtonView(configuration: configuration.button)
            TextView(textConfiguration: configuration.text)
        }
    }
}
