//
//  ActivityCell.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/18/23.
//

import SwiftUI

struct ActivityCell: View {
    
    var image: String = "testActivityImage"
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(image)
                .resizable()
                .frame(width: UIScreen.twoColumnsCellWidth, height: 200)
            VStack(alignment: .leading) {
                Text("DIY")
                    .orangeBirdHeadline()
                    .foregroundStyle(Color.alwaysBlack)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(Color.usearthBlue)
                    .clipShape(Capsule())
                    .padding(.all, 8)
                
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Image(systemName: "hammer.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color.usEarthBlue)
                        Text("2023년 12월 18일")
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

#Preview {
    HStack(spacing: 8) {
        ActivityCell()
        ActivityCell()
    }
}
