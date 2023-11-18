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
    @Relationship var Activities: [Activity]?
    var username: String
    var designationPrefix: DesignationPrefix
    var desionationSuffix: DesignationSuffix
    
    init(username: String, designationPrefix: DesignationPrefix, desionationSuffix: DesignationSuffix) {
        self.username = username
        self.designationPrefix = designationPrefix
        self.desionationSuffix = desionationSuffix
    }
}
