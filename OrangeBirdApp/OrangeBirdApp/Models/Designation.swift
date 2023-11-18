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
    case ecoStuff = "친환경 제품 구입"
}

enum DesignationSuffix: String, CaseIterable, Codable {
    case walkMaster = "걷기마스터"
    case walkToEnd = "걸어서 세계 끝으로"
    case greatestTraveler = "위대한 여행가"
    case northBearGaurdien = "북극곰 수호자"
    case goldHand = "금손"
    case reviveMagician = "재생의 마술사"
    case maestro = "마에스트로"
    case ecoStyleArtist = "에코스타일 아티스트"
    case ecoDriver = "친환경 드라이버"
    case niceConsumer = "현명한 소비자"
}

