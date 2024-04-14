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
    
    // MARK: - Types
    
    typealias EmojiButton = StatableButtonViewConfiguration<Text>
    
    // MARK: - Public Properties
    
    public lazy var navigationConfiguration = NavigationViewConfiguration(title: "Add a Habit") { [unowned self] in
            habitsViewModel.shouldShowAddHabitView = false
    }
        
    @Published public var emojiButton: EmojiButton!
    @Published public var isEmojiPickerShown = false
    @Published public var emoji = "💧"
    
    public lazy var titleTextField = TextFieldDisplay(contentDisplay: .bodyCentred, plateDisplay: .input, accentColor: .appColorMediumOrange)
    @Published var title: String = ""
    
    @Published var colorPicker = ColorPickerViewConfiguration()
    
    // MARK: - Private Properties

    @ObservedObject private var habitsViewModel: HabitsViewModel

    // MARK: - Life Cycles

    init(habitsViewModel: HabitsViewModel) {
        self.habitsViewModel = habitsViewModel
    
        Publishers.CombineLatest(
            $emoji.eraseToAnyPublisher(),
            colorPicker.$selected.eraseToAnyPublisher()
        )
        .map { [unowned self] emoji, hex in
            makeEmojiButton(emoji: emoji, hex: hex)
        }
        .assign(to: &$emojiButton)
         
    }
    
    // MARK: - Private Methods

    private func makeEmojiButton(emoji: String, hex: String) -> EmojiButton {
        StatableButtonViewConfiguration(
            content: Text(emoji),
            activeDisplay: .emojiForDetail(plateColor: Color(hex: hex)),
            disabledDisplay: nil,
            highlightedDisplay: nil,
            animation: .scale,
            statePublisher: nil,
            action: { [unowned self] in
                isEmojiPickerShown.toggle()
            }
        )
    }
}
