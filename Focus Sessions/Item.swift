//
//  Item.swift
//  Focus Sessions
//
//  Created by Kristian Matthews-Kennington on 16/09/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
