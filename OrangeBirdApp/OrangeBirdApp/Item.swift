//
//  Item.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/13/23.
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
