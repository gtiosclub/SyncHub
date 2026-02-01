//
//  Item.swift
//  SyncHub
//
//  Created by Steven Liu on 1/31/26.
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
