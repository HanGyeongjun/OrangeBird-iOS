//
//  Designation.swift
//  SwiftDataT
//
//  Created by hello on 11/18/23.
//

import Foundation


enum DesignationPrefix: String, CaseIterable, Codable {
    case plogging = "플로깅"
    case recycle = "분리배출"
    case diy = "DIY"
    case ecoStuff = "친환경 제품"
}

enum DesignationSuffix: String, CaseIterable, Codable {
    case environSafer = "환경 지킴이"
    case earthSafer = "지구 지킴이"
    case greatestWalk = "위대한 발걸음"
    case polarBearGaurdien = "북극곰 수호자"
    case goldHand = "금손"
    case niceConsumer = "현명한 소비자"
}

