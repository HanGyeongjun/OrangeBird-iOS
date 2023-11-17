//
//  UIColor+Extension.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/16/23.
//

import UIKit

extension UIColor {
    convenience init(light: UIColor, dark: UIColor) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light, .unspecified:
                return light
            case .dark:
                return dark
            @unknown default:
                return light
            }
        }
    }
}

extension UIColor {
    //TODO: - UIKit을 사용하게 될 경우 추가합니다.
}
