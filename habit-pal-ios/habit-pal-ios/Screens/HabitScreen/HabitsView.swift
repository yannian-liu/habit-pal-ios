//
//  ContentView.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 21/3/2024.
//

import SwiftUI
import SwiftData
import UIToolbox

struct HabitsView: View {
    @ObservedObject private var viewModel = HabitsViewModel()

    let columns = [
        GridItem(.adaptive(minimum: 55, maximum: 100), alignment: .top)
    ]

    var body: some View {
        ScrollView {
            ZStack {
                HStack {
                    TextView(textConfiguration: viewModel.todayTextConfiguration)
                    Spacer()
                    StatableButtonView(configuration: viewModel.settingsButton)
                        .sheet(isPresented: $viewModel.shouldShowSettings) {
                            SettingsView(viewModel: viewModel.settingsViewModel)
                        }
                    
                    Spacer().frame(width: 8)
                    StatableButtonView(configuration: viewModel.addButton)
                        .sheet(isPresented: $viewModel.shouldShowAddHabitView) {
                            AddHabitView(viewModel: viewModel.addHabitViewModel)
                        }

                }

            }
            
            if viewModel.noHabits {
                HStack {
                    Spacer()
                    TextView(textConfiguration: viewModel.emptyText)
                        .fixedSize(horizontal: true, vertical: true)
                    Spacer()
                }
                .plateDisplay(.card)
                
            } else {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.cellConfigurations, id: \.self) { configuration in
                        HabitsTaskCell(configuration: configuration)
                    }
                }
                .plateDisplay(.card)

            }

        }
        .contentMargins(.all, 16)
        .background(.backgroundPrimary)
        .onAppear(perform: {
            Utilities().overrideDisplayMode()
        })
    }
}

#Preview {
    HabitsView()
}
