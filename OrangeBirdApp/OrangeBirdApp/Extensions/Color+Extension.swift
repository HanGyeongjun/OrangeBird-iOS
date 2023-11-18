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
    static let usEarthPrimary = Color("MainGreen300")
    static let usEarthDisabled = Color("MainGreen200")
    
    //MARK: - Category
    static let usEarthOrange = Color("usearthOrange")
    static let usEarthYellow = Color("usearthYellow")
    static let usEarthBlue = Color("usearthBlue")
    static let usEarthPurple = Color("usearthPurple")
    
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
    static let sucess = Color("orangeBirdGreen")
    static let warning = Color("orangeBirdYellow")
    static let error = Color("orangeBirdRed")
}
