//
//  ColorPickerViewConfiguration.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 13/4/2024.
//

import Foundation
import Combine
import SwiftUI
import UIToolbox

class ColorPickerViewConfiguration: ObservableObject {
        
    typealias ButtonConfiguration = StatableButtonViewConfiguration<Circle>
    @Published public var selected: String = "60c3db"
    
    @Published public var cellConfigurations = [Tagged<ButtonConfiguration>]()
    
    private var defaultColorHexes: [String] = [
        "60c3db",
        "ffe38d",
        "ffa1ac",
        "ffab4d",
        "006f3c",
        "b0b8ce",
        "eaebfe",
        "7777aa",
        "b8d3e8",
        "d90c0f",
        "eed9c4",
        "6280ff",
        "ff7400",
        "cb9992",
        "c79daf",
        "d9ead3",
        "fff2cc",
        "f15152",
        "8ebec4",
        "f8aa9e",
        "559f4c",
        "7fbf7f",
        "f19d52",
    ]
        
    init() {
        cellConfigurations = defaultColorHexes
            .map { [unowned self] hex in
            Tagged(
                tag: hex,
                wrappedValue: StatableButtonViewConfiguration(
                    content: Circle(),
                    activeDisplay: colorButtonDisplay(hex: hex, selected: false),
                    disabledDisplay: nil,
                    highlightedDisplay: colorButtonDisplay(hex: hex, selected: true),
                    animation: .scale,
                    statePublisher: $selected.map { selected in
                        selected == hex ? .highlighted : .active
                    }.eraseToAnyPublisher(),
                    action: { [unowned self] in
                        select(hex)
                    }
                )
            )
        }
    }
    public func select(_ hex: String) {
        selected = hex
    }
    
    private func colorButtonDisplay(hex: String, selected: Bool) -> ButtonConfiguration.Display {
        .init(
            contentDisplay: .init(font: .headline, color: Color(hex: hex), multilineTextAlignment: .center),
            plateDisplay: .init(sizeStyle: .padding(edgeInsets: .init(top: 5, leading: 5, bottom: 5, trailing: 5)), color: .clear, shape: .circle, border:  .primary(selected ? .buttonPrimaryBackground : .clear)))
    }
    
}

struct Tagged<Value> {
    let tag: String
    let wrappedValue: Value
}
