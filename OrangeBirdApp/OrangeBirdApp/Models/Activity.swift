//
//  Activity.swift
//  SwiftDataT
//
//  Created by hello on 11/18/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Activity: Identifiable {
    @Attribute(.unique) var id = UUID()
    var date: Date = Date()
    var category: ActivityType
    var image: Data
    var memo: String
    var currentLevel: Int
    
    init(category: ActivityType, memo: String, currentLevel: Int) {
        self.category = category
        self.memo = memo
        self.currentLevel = currentLevel
        self.image = UIImage(named: "default_image")!.pngData()!
    }
    
    
    func setImage(image: UIImage) {
        self.image = convertImageToData(image: image)
    }
    
    func convertImageToData(image: UIImage) -> Data {
        return image.pngData()!
    }
    
    func convertDataToImage(data: Data) -> UIImage {
        return UIImage(data: data)!
    }
}
