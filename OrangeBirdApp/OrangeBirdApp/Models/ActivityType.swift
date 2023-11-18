//
//  ActivityType.swift
//  SwiftDataT
//
//  Created by hello on 11/18/23.
//

import Foundation
import SwiftUI

enum ActivityType: Int, Codable, CaseIterable {
    case ecoStuff = 0
    case diy
    case recycle
    case plogging
    
    func color() -> Color {
        switch self {
        case.ecoStuff:
            return Color.usEarthYellow
        case.diy:
            return Color.usEarthOrange
        case.plogging:
            return Color.usEarthPurple
        case.recycle:
            return Color.usEarthBlue
        }
    }

    func description() -> String {
        switch self {
        case.ecoStuff:
            return "친환경적인 재료 혹은 친환경 포장재를 사용한 제품을 구매하거나 사용하는 활동이에요."
        case.diy:
            return "업사이클링 또는 리사이클링을 통하여 기존 제품을 재활용하는 활동이에요."
        case.recycle:
            return "재활용을 위해 종류별로 쓰레기를 구분하여 버리는 활동이에요."
        case.plogging:
            return "조깅하며 쓰레기를 수거하는 활동이에요."
        }
    }
    
    func icon() -> Image {
        switch self {
        case.ecoStuff:
            return Image("EcoProduct")
        case.diy:
            return Image("DIY")
        case.recycle:
            return Image("Recycle")
        case.plogging:
            return Image("Flogging")
        }
    }
    
    func koreanTitle() -> String {
        switch self {
        case.ecoStuff:
            return "친환경 구매"
        case.diy:
            return "DIY"
        case.recycle:
            return "재활용"
        case.plogging:
            return "플로깅"
        }
    }
}


func getActivityType(index: Int) -> ActivityType {
    switch index {
    case 0:
        return .ecoStuff
    case 1:
        return .diy
    case 2:
        return .recycle
    case 3:
        return .plogging
    default:
        return .plogging
    }
}
