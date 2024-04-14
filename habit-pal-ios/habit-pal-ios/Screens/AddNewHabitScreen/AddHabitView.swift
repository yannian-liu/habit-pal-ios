//
//  AddScreen.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 21/3/2024.
//

import Foundation
import UIToolbox
import SwiftUI
import MCEmojiPicker

struct AddHabitView: View {
    @ObservedObject var viewModel: AddHabitViewModel

    var body: some View {
        ScrollView {
            NavigationView(configuration: viewModel.navigationConfiguration)
            
            ZStack {
                StatableButtonView(configuration: viewModel.emojiButton)
                    .emojiPicker(
                        isPresented: $viewModel.isEmojiPickerShown,
                        selectedEmoji: $viewModel.emoji
                    )
                
            }
            
            Spacer().frame(height: 16)
            
            TextField("Please enter the title", text: $viewModel.title)
                .textFieldDisplay(viewModel.titleTextField)
            
            Spacer().frame(height: 16)
            
            PaletteView(configuration: viewModel.colorPicker)
                .plateDisplay(.card)
            
        }
        .background(.backgroundPrimary)
        .contentMargins(.all, 16)
        .scrollDismissesKeyboard(.automatic)
        .onTapGesture(perform: UIApplication.dismissKeyboard)

    }
}

#Preview {
    AddHabitView(viewModel: AddHabitViewModel(habitsViewModel: HabitsViewModel()))
}
