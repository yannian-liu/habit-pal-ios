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
    typealias EmojiButton = StatableButtonViewConfiguration<Text>
    private var cancellables = Set<AnyCancellable>()

    @ObservedObject private var habitsViewModel: HabitsViewModel

    public lazy var navigationConfiguration = NavigationViewConfiguration(title: "Add a Habit") { [unowned self] in
            habitsViewModel.shouldShowAddHabitView = false
    }
        
    @Published var emojiButton: EmojiButton!
    
    @Published private var emoji = "💧"

    init(habitsViewModel: HabitsViewModel) {
        self.habitsViewModel = habitsViewModel
    
        $emoji
            .map { [unowned self] in
                makeEmojiButton(with: $0)
            }
            .assign(to: &$emojiButton)
    }
    
    private func makeEmojiButton(with text: String) -> EmojiButton {
        StatableButtonViewConfiguration(
            content: Text(text),
            activeDisplay: .emojiForDetail(plateColor: .blue),
            disabledDisplay: nil,
            highlightedDisplay: nil,
            animation: .scale,
            statePublisher: nil,
            action: { [unowned self] in
                
            }
        )
    }
}
