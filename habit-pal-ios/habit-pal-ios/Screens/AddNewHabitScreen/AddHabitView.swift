//
//  AddScreen.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 21/3/2024.
//

import Foundation
import UIToolbox
import SwiftUI

struct AddHabitView: View {
    @ObservedObject var viewModel: AddHabitViewModel
    var body: some View {
        ScrollView {
            ZStack {
                
                TextView(textConfiguration: viewModel.navigationTitle)
                HStack {
                    Spacer()
                    StatableButtonView(configuration: viewModel.closeButton)
                }
            }
            
        }
        .background(.backgroundPrimary)
        .contentMargins(.all, 16)
    }
}

#Preview {
    AddHabitView(viewModel: AddHabitViewModel(habitsViewModel: HabitsViewModel()))
}
