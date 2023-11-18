//
//  Level.swift
//  OrangeBirdApp
//
//  Created by hello on 11/19/23.
//

import Foundation

enum Level: Int, CaseIterable {
    case level0 = 0
    case level1 = 1
    case level2 = 2
    case level3 = 3
    case level4 = 4
    case level5 = 5
    
    
    func description() -> String {
        switch self {
        case.level0:
            return "환경좀 생각하세요"
        case.level1:
            return "잘하고 있어요"
        case.level2:
            return "Good :)"
        case.level3:
            return "Very Good :D"
        case.level4:
            return "Very Very Good :D"
        case.level5:
            return "전문가시군요"
        }
    }
}

extension User {
    func getLevel(currentExp: Int) -> Level{
        switch currentExp {
        case ..<1:
            return .level0
        case 1..<5:
            return .level1
        case 5..<10:
            return .level2
        case 10..<25:
            return .level3
        case 25..<50:
            return .level4
        default:
            return .level5
        }
    }
}

func getExp(level: Int) -> Int {
    if level < 0 {
        return 0
    }
    switch level {
    case 0:
        return 1
    case 1:
        return 5
    case 2:
        return 10
    case 3:
        return 25
    case 4:
        return 50
    default:
        return 50
    }
}
