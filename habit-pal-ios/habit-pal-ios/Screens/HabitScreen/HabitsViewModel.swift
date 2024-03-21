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

class HabitsViewModel: ObservableObject {
    @Published public var shouldShowAddNewHabitView = false
    
    public lazy var addButton = StatableButtonViewConfiguration(
        content: Image("appPlus"),
        activeDisplay: .roundImageButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{ [unowned self] in shouldShowAddNewHabitView.toggle() }
    )
    
    public let editButton = StatableButtonViewConfiguration(
        content: Image("pencil"),
        activeDisplay: .roundImageButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{}
    )
}
