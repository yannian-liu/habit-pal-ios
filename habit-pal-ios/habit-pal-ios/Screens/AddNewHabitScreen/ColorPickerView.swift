//
//  ColorPickerView.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 13/4/2024.
//

import Foundation
import SwiftUI
import UIToolbox

struct ColorPickerView: View {
    
    @ObservedObject var configuration: ColorPickerViewConfiguration
    
    let columns = [
        GridItem(.adaptive(minimum: 36, maximum: 100), alignment: .top)
    ]

    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(configuration.cellConfigurations, id: \.self.tag) { cellConfiguration in
                StatableButtonView<Circle>(configuration: cellConfiguration.wrappedValue)
                    .frame(width: 36)
            }
        }
        .plateDisplay(.card)
    }
}
