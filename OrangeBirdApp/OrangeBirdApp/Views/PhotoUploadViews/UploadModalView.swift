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
            setCategoryView()
        }
        .padding(.horizontal, 16)
        .background(Color.orangeBirdBackground)
        .presentationDragIndicator(.visible)
    }
    
    @ViewBuilder
    private func setCategoryView() -> some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
        
        LazyVGrid(columns: columns, alignment: .listRowSeparatorLeading, spacing: 8) {
            Button(action: {
                SetImageView(activityType: ActivityType.plogging)
            }) {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 200, height: 300)
                    .foregroundStyle(ActivityType.ecoStuff.color())
            }
            Button(action: {
                
            }) {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 200, height: 300)
                    .foregroundStyle(ActivityType.diy.color())
            }
            Button(action: {
                
            }) {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 200, height: 300)
                    .foregroundStyle(ActivityType.recycle.color())
            }
            Button(action: {
                
            }) {
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 200, height: 300)
                        .foregroundStyle(ActivityType.plogging.color())
                    VStack {
                        
                        HStack {
                            Text(ActivityType.plogging.koreanTitle())
                                .foregroundStyle(.white)
                            Spacer()
                            ActivityType.plogging.icon().resizable().frame(width:24, height: 24)
                        }
                        .padding()
                        Spacer()
                        HStack(alignment: .firstTextBaseline) {
                            Text(ActivityType.plogging.description())
                                .foregroundStyle(.white)
                        }
                        .padding()
                    }
                    .padding()
                }
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
