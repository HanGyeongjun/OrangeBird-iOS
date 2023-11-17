//
//  Date+String.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/15/23.
//

import Foundation

extension Date {
    
    /// Date를 yyyyMMddHHmmss 형태의 String으로 변환해주는 함수입니다.
    /// 다른 형식의 Date가 필요하다면 속성을 추가하면 됩니다.
    func getCurrentDate() -> String {
        let current = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyyMMddHHmmss"
        
        return formatter.string(from: current)
    }
}
