//
//  Color+Extension.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/16/23.
//

import SwiftUI

extension Color {
    init(light: Color, dark: Color) {
        self.init(UIColor(light: UIColor(light), dark: UIColor(dark)))
    }
}

extension Color {
    //MARK: - Semantic Colors
}

extension Color {
    //MARK: - Primary
    static let orangeBirdBackground = Color("Gray200")
    static let orangeBirdPrimary = Color("Primary300")
    static let orangeBirdPrimaryDisabled = Color("Primary200")
    
    //MARK: - GrayScale
    static let gray1 = Color("Gray100")
    static let gray2 = Color("Gray200")
    static let gray3 = Color("Gray300")
    static let gray4 = Color("Gray400")
    static let gray5 = Color("Gray500")
    static let gray6 = Color("Gray600")
    static let gray7 = Color("Gray700")
    static let gray8 = Color("Gray800")
    
    //MARK: - Status
    static let sucess = Color("Green")
    static let warning = Color("Yellow")
    static let error = Color("Red")
}
