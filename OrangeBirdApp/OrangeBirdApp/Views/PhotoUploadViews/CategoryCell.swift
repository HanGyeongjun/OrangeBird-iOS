//
//  CategoryCell.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/19/23.
//

import SwiftUI

struct CategoryCell: View {
    var activityType: ActivityType

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            activityType.icon()
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
            Text(activityType.koreanTitle())
                .orangeBirdTitle1()
                .foregroundStyle(activityType.color())
        }
        .padding(.vertical, 16)
        .frame(width: UIScreen.twoColumnsCellWidth)
        .background(Color.alwaysWhite)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

//#Preview {
//    CategoryCell()
//}
