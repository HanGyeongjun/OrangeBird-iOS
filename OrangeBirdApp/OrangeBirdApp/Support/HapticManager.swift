//
//  HapticManager.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/15/23.
//

import SwiftUI

class HapticManager {
    
    ///Haptic이 필요한 View에 다음과 같이 import해서 사용합니다.
    ///private let hapticManager = HapticManager.instance
    
    static let instance = HapticManager()
    private init() {}
    
    ///Notification Haptic을 출력하기 위한 함수입니다.
    ///hapticManager.notification(type: .typeName)
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    ///Impact Haptic을 출력하기 위한 함수입니다.
    ///hapticManager.impact(style: .styleName)
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
