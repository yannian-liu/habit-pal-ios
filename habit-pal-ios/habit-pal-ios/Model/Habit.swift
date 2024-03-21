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

    init(id: Int, groupId: Int, title: String, emoji: String, color: String) {
        self.id = id
        self.groupId = groupId
        self.title = title
        self.emoji = emoji.code
        self.color = color
    }
}

