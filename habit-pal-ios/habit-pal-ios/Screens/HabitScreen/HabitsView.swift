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

    let rows = [
         GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible())
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
                }
                
                if viewModel.shouldShowAddNewHabitView {
                    AddNewHabitView()
                }
            }
            
            LazyHGrid(rows: rows) {
                ForEach(viewModel.habitConfigurations, id: \.self) { configuration in
                    HabitCell(configuration: configuration)
                }
            }

            Text("Coontent")
                .frame(width: 300, height: 300)
                .background(.cardBackground)

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
