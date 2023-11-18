//
//  ActivityCell.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/18/23.
//

import SwiftUI

struct ActivityCell: View {
    
    var image: String = "testActivityImage"
    var activity: Activity
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(image)
                .resizable()
                .frame(width: UIScreen.twoColumnsCellWidth, height: 200)
            VStack(alignment: .leading) {
                Text(activity.category.koreanTitle())
                    .orangeBirdHeadline()
                    .foregroundStyle(Color.alwaysBlack)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(activity.category.color())
                    .clipShape(Capsule())
                    .padding(.all, 8)
                
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        activity.category.icon()
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundStyle(activity.category.color())
                        Text(activity.date.getDate())
                            .orangeBirdBody2()
                            .foregroundStyle(Color.alwaysBlack)
                            .lineLimit(1)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.all, 8)
                .background(Color.alwaysWhite)
                .opacity(0.6)
            }
        }
        .frame(width: UIScreen.twoColumnsCellWidth, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

//#Preview {
//    HStack(spacing: 8) {
//        ActivityCell()
//        ActivityCell()
//    }
//}
