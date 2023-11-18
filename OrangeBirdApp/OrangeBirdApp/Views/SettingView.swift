//
//  SettingView.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/16/23.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 32) {
                settingViewCell(image: "app.badge", title: "앱 정보")
                settingViewCell(image: "app.fill", title: "앱 정보")
                divider()
                settingViewCell(image: "app.fill", title: "앱 정보")
                settingViewCell(image: "app.fill", title: "앱 정보")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("설정")
        .background(Color.gray2)
    }
    
    /// 설정 뷰 셀
    @ViewBuilder
    private func settingViewCell(image: String, title: String) -> some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: image)
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundStyle(Color.accentColor)
            Text(title)
                .orangeBirdBody1()
                .foregroundStyle(Color.accentColor)
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    /// Divider
    @ViewBuilder
    private func divider() -> some View {
        Divider()
            .frame(width: UIScreen.screenWidth - 32)
    }
}

#Preview {
    SettingView()
}
