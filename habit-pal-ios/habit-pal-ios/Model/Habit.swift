//
//  Item.swift
//  habit-pal-ios
//
//  Created by Yannian Liu on 21/3/2024.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Habit {
    @Attribute(.unique) var id: Int
    @Attribute var groupId: Int
    var title: String
    var emoji: String
    var color: String
    var dates: [Date]

    init(id: Int, groupId: Int, title: String, emoji: String, color: String) {
        self.id = id
        self.groupId = groupId
        self.title = title
        self.emoji = emoji.code
        self.color = color
        self.dates = []
    }
    
    func toggleComplete() {
        if isCompletedToday {
            dates.removeLast()
        } else {
            dates.append(Date())
        }
    }
    
    var isCompletedToday: Bool {
        if let lastDate = dates.last,
           Calendar.current.isDateInToday(lastDate) {
            return true
        } else {
            return false
        }
    }
}

