//
//  AddScreen.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 21/3/2024.
//

import Foundation
import UIToolbox
import SwiftUI

struct AddNewHabitView: View {
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                Text("Add New Habit")
                    .font(.custom(.FontName.avenirBlack, size: 12))
                Spacer()
            }
            
        }
        .background(.lightLightBlue)
        .bordered(border: .primary, shape: .rectangle(cornerRadius: 5))
        .contentMargins(.all, 16)
    }
}

#Preview {
    AddNewHabitView()
}
