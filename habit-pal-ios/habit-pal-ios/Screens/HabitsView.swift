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
            HStack {
                Text("Today is 3rd May")
                    .font(.custom(.FontName.avenirBlack, size: 16))
                    .foregroundStyle(.navyBlue)
                Spacer()
                StatableButtonView(configuration: viewModel.editButton)
                Spacer().frame(width: 16)
                StatableButtonView(configuration: viewModel.addButton)
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
