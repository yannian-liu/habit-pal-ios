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
    @Published public var selected: Color = .blue
    
    @Published public var cellConfigurations = [Tagged<ButtonConfiguration>]()
    
    private var colors: [Color] = [.blue, .red, .green, .yellow, .purple, .orange, .pink, .black]
    
    init() {
        cellConfigurations = colors.map { [unowned self] color in
            Tagged(
                tag: color.hex,
                wrappedValue: StatableButtonViewConfiguration(
                    content: Circle(),
                    activeDisplay: colorButtonDisplay(color: color, selected: false),
                    disabledDisplay: nil,
                    highlightedDisplay: colorButtonDisplay(color: color, selected: true),
                    animation: .scale,
                    statePublisher: $selected.map { selected in
                        selected.hex == color.hex ? .highlighted : .active
                    }.eraseToAnyPublisher(),
                    action: { [unowned self] in
                        select(color)
                    }
                )
            )
        }
    }
    public func select(_ color: Color) {
        selected = color
    }
    
    private func colorButtonDisplay(color: Color, selected: Bool) -> ButtonConfiguration.Display {
        .init(
            contentDisplay: .init(font: .headline, color: color, multilineTextAlignment: .center),
            plateDisplay: .init(sizeStyle: .padding(edgeInsets: .init(top: 5, leading: 5, bottom: 5, trailing: 5)), color: .clear, shape: .circle, border:  .primary(selected ? .buttonPrimaryBackground : .clear)))
    }
    
}

struct Tagged<Value> {
    let tag: String
    let wrappedValue: Value
}
