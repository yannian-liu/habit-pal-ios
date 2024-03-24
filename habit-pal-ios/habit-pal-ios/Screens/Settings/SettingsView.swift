//
//  SettingsView.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 22/3/2024.
//

import Foundation
import SwiftUI
import UIToolbox

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        ScrollView {
            ZStack {
                
                TextView(textConfiguration: viewModel.navigationTitle)
                HStack {
                    Spacer()
                    StatableButtonView(configuration: viewModel.closeButton)
                }
            }
            HStack {
                TextView(textConfiguration: viewModel.colorSchemeTitleConfiguration)
                Spacer()
            }
            HStack {
                Spacer().frame(width: 32)
                SingleSelectionOptionView(configuration: viewModel.colorSchemeOptionsViewConfiguration)
                Spacer()
            }
            
        }
        .background(.backgroundPrimary)
        .contentMargins(.all, 16)
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var presented = true

    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel(habitsViewModel: HabitsViewModel()))
            .preferredColorScheme(.light)
        SettingsView(viewModel: SettingsViewModel(habitsViewModel: HabitsViewModel()))
            .preferredColorScheme(.dark)
    }
}