//
//  StickyHeader.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/15/23.
//

import SwiftUI

struct StickyHeader: View {
    
    /**
     StickyHeader 컴포넌트
     
     #parameters
     - height: 배경의 높이 값
     - image: 이미지 파일명
     - color: 배경 색상
     
     #description
     - sticky header가 필요한 곳에서 사용할 수 있습니다.
     - 이미지가 적용되어야 할 경우에만 이미지 파일명을 넣어주시면 됩니다.
     */
    
    var height: CGFloat
    var image: String?
    var color: Color?
    
    var body: some View {
        GeometryReader { geo in
            let yOffset = geo.frame(in: .global).minY
            let width = geo.size.width
            
            if let image {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width,
                           height: height + (yOffset > 0 ? yOffset : 0))
                    .clipped()
                    .offset(y: yOffset > 0 ? -yOffset : 0)
            } else {
                (color ?? Color.gray)
                    .frame(width: width,
                           height: height + (yOffset > 0 ? yOffset : 0))
                    .offset(y: yOffset > 0 ? -yOffset : 0)
            }
        }
        .frame(minHeight: height)
    }
}

#Preview {
    ScrollView {
        StickyHeader(height: 16,
                     color: Color.accentColor)
    }
}
