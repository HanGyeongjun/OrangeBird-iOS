//
//  ActivityType.swift
//  SwiftDataT
//
//  Created by hello on 11/18/23.
//

import Foundation
import SwiftUI

enum ActivityType: Int, Codable {
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
            return "eco STUFF"
        case.diy:
            return "DIY"
        case.recycle:
            return "RECYCLE"
        case.plogging:
            return "plogging"
        }
    }
    
    func icon() -> Image {
        switch self {
        case.ecoStuff:
            return Image("ecostuff")
        case.diy:
            return Image("diy")
        case.recycle:
            return Image("recycle")
        case.plogging:
            return Image("plogging")
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

