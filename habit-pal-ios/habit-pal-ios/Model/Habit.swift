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
    var title: String
    var emoji: String
    var color: String

    init(id: Int, title: String, emoji: Character, color: String) {
        self.id = id
        self.title = title
        self.emoji = String(emoji).code
        self.color = color
    }
}

