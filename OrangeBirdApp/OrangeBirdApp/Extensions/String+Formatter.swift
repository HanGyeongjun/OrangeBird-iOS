//
//  String+Formatter.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/15/23.
//

import SwiftUI

extension String {
    
    /// SwiftUI의 고질적인 줄바꿈 이슈를 해결하기 위한 변수입니다.
    var lineBreaking: String { self + "           " }
    
    /// 특수문자가 포함되어있는지 확인하는 함수입니다.
    func isNormalString() -> Bool {
        let specialCharacters = "!@#$%^&*()~`_+-=[]{}|;':\",./<>? "
        var result = true
        
        for char in specialCharacters {
            if self.contains(char) {
                result = false
            }
        }
        return result
    }
}
