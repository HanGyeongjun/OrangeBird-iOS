//
//  UploadModalView.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/19/23.
//

import SwiftUI

struct UploadModalView: View {
    
    @Binding var isShowModal: Bool
    @State var setCategory: Category?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center) {
                Button {
                    isShowModal.toggle()
                } label: {
                    Text("닫기")
                        .orangeBirdHeadline()
                        .foregroundStyle(Color.usEarthPrimary)
                }
                .padding(.vertical, 24)
            }
            Spacer()
            setCategoryView()
            Spacer()

        }
        .padding(.horizontal, 16)
        .background(Color.orangeBirdBackground)
        .presentationDragIndicator(.visible)
    }
    
    @ViewBuilder
    private func setCategoryView() -> some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
        
        
        LazyVGrid(columns: columns, alignment: .listRowSeparatorLeading, spacing: 8) {
            ForEach(ActivityType.allCases, id: \.self)  {activityType in
                CategoryCell(activityType: activityType)
            }
        }
    }
}

struct SetImageView: View {
    var activityType: ActivityType
    
    var body: some View {
        Text(activityType.description())
    }
}
