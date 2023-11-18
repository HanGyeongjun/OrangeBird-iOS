//
//  User.swift
//  OrangeBirdApp
//
//  Created by hello on 11/18/23.
//

import Foundation
import SwiftData

@Model
class User: Identifiable {
    @Attribute(.unique) var id = UUID()
    var username: String
    var designationPrefix: DesignationPrefix
    var desionationSuffix: DesignationSuffix
    
    init(username: String, designationPrefix: DesignationPrefix, desionationSuffix: DesignationSuffix) {
        self.username = username
        self.designationPrefix = designationPrefix
        self.desionationSuffix = desionationSuffix
    }
}

extension User {
    func activityNumbers(activities: [Activity]) -> [Int] {
        var sum = [0, 0, 0, 0]
        activities.forEach{
            sum[$0.category.rawValue] += 1
        }
        return sum
    }
    func mostIndex(sum: [Int]) -> Int {
        var maxIndex = 0;
        
        for i in 0..<4 {
            if sum[maxIndex] < sum[i] {
                maxIndex = i
            }
        }
        return maxIndex
    }
}
