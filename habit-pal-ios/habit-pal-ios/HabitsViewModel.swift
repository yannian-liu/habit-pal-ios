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
    public let addButton = StatableButtonViewConfiguration(
        content: Image("plus"),
        activeDisplay: .init(font: .headline, foregroundColor: .white, backgroundColor: .mediumOrange, sizeStyle: .paddingDefault, shape: .circle, border: nil),
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil,
        action:{}
    )
}
