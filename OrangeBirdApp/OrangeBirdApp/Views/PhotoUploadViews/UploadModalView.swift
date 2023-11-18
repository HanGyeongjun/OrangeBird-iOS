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
    @State var tappedCategory: String = ""
    
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
            if (tappedCategory.isEmpty) {
                setCategoryView()
            } else {
                SetImageView(activityType: tappedCategory)
            }
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
                    .onTapGesture {
                        tappedCategory = activityType.koreanTitle()
                    }
            }
        }
    }
}

struct SetImageView: View {
    var activityType: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image("exampleImage")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.screenWidth - 48)
            HStack {
                Button {
                    //공유 이미지
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 20, height: 20)
                        .padding(.all, 32)
                        .foregroundStyle(Color.usEarthPrimary)
                        .background(Color.gray4)
                        .clipShape(Circle())
                }
            }
        }

    }
}
