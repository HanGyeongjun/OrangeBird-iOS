//
//  View+UIFont.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/16/23.
//

import SwiftUI

extension View {
    func orangeBirdLargeTitle() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .orangeBirdLargeTitle, lineHeight: 38))
    }
    func orangeBirdTitle1() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .orangeBirdTitle1, lineHeight: 32))
    }
    func orangeBirdTitle2() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .orangeBirdTitle2, lineHeight: 28))
    }
    func orangeBirdHeadline() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .orangeBirdHeadline, lineHeight: 22))
    }
    func orangeBirdBody1() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .orangeBirdBody1, lineHeight: 22))
    }
    func orangeBirdBody2() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .orangeBirdBody2, lineHeight: 20))
    }
    func orangeBirdSubtitle() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .orangeBirdSubtitle, lineHeight: 20))
    }
    func orangeBirdFootnote() -> some View {
        ModifiedContent(content: self, modifier: FontWithLineHeight(font: .orangeBirdFootnote, lineHeight: 18))
    }
}

/// LineHeight 설정을 위한 View Modifier
struct FontWithLineHeight: ViewModifier {
    let font: UIFont
    let lineHeight: CGFloat

    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
}
