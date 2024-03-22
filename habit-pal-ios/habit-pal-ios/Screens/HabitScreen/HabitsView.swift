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
    @Environment(\.modelContext) private var modelContext
    @Query private var habits: [Habit]
    @ObservedObject private var viewModel = HabitsViewModel()

    var body: some View {
        ScrollView {
            ZStack {
                HStack {
                    TextView(textConfiguration: viewModel.todayTextConfiguration)
                    Spacer()
                    StatableButtonView(configuration: viewModel.settingsButton)
                        .sheet(isPresented: $viewModel.shouldShowSettings) {
                            SettingsView()
                        }

                    Spacer().frame(width: 16)
                    StatableButtonView(configuration: viewModel.addButton)
                }
                
                if viewModel.shouldShowAddNewHabitView {
                    AddNewHabitView()
                }
            }
            
            
            NavigationSplitView {
                List {
                    ForEach(habits) { habit in
                        NavigationLink {
                            Text("Item at \(habit.title)")
                        } label: {
                            Text(habit.title)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    
                }
            } detail: {
                Text("Select an item")
            }
        }
        .contentMargins(.all, 16)
        .background(.lightLightBlue)
    }

    private func addItem() {
        withAnimation {
            let newItem = Habit(id: 0, groupId: 1, title: "hahaha", emoji: "🇺🇸", color: "FFFFFF")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(habits[index])
            }
        }
    }
}

#Preview {
    HabitsView()
        .modelContainer(for: Habit.self, inMemory: true)
}

class MockData {
    let habits = [
        Habit(id: 001, groupId: 001, title: "Water", emoji: "💧".code, color: Color.blue.hex),
        Habit(id: 002, groupId: 001, title: "Milk", emoji: "🍼".code, color: Color.yellow.hex),
        Habit(id: 003, groupId: 002, title: "Cereal", emoji: "🍚".code, color: Color.red.hex),
    ]
    
    let groups = [
        Group(id: 001, title: "Morning"),
        Group(id: 002, title: "Afternoon"),
    ]
}
