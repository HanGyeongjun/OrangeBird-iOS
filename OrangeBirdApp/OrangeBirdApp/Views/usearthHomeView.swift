//
//  usearthHomeView.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/18/23.
//

import SwiftUI

struct usearthHomeView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    profileSection(profileImage: nil, userName: "유저이름", designation: "플로깅안하는 환경파괴자")
                    levelSection(level: 3, levelDescription: "일해라 휴먼 일해라 휴먼 일해라 휴먼 일해라 휴먼")
                    pieChartSection(mostDidCategory: "플로깅")
                    recentActiviesSection()
                }
            }
            Button {
                //활동 추가 버튼 로직 구현
            } label: {
                ZStack(alignment: .center) {
                    Circle()
                        .frame(width: 72, height: 72)
                        .foregroundStyle(Color.usEarthPrimary)
                    Image(systemName: "plus")
                        .resizable()
                        .fontWeight(.bold)
                        .frame(width: 32, height: 32)
                        .foregroundStyle(Color.gray1)
                }
            }
            .padding(.all, 16)
        }
        .background(Color.orangeBirdBackground)
    }
    
    @ViewBuilder
    private func profileSection(profileImage: Image?, userName: String, designation: String) -> some View {
        HStack(spacing: 16) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 56, height: 56)
                .foregroundStyle(Color.gray4)
            VStack(alignment: .leading, spacing: 4) {
                Text(userName)
                    .orangeBirdTitle2()
                    .foregroundStyle(Color.gray8)
                Text(designation)
                    .orangeBirdBody1()
                    .foregroundStyle(Color.gray7)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private func levelSection(level: Int, levelDescription: String) -> some View {
        
        let progressBarWidth = UIScreen.screenWidth - 56
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Lv. \(level)")
                .orangeBirdTitle2()
                .foregroundStyle(Color.gray1)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(Color.usEarthPrimary)
                .clipShape(Capsule())
            
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: progressBarWidth,
                           height: 20)
                    .foregroundStyle(Color.gray1)
                
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: (progressBarWidth / 2),
                           height: 20)
                    .foregroundStyle(Color.usEarthPrimary)
            }
            
            Text(levelDescription)
                .orangeBirdBody2()
                .foregroundStyle(Color.gray7)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
        .padding(.all, 12)
        .background(Color.gray3)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private func pieChartSection(mostDidCategory: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("내가 가장 많이 한 활동은")
                    .orangeBirdBody1()
                    .foregroundStyle(Color.gray7)
                HStack(alignment: .center) {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: 60, height: 16)
                            .foregroundStyle(Color.usEarthPrimary)
                            .opacity(0.6)
                        Text(mostDidCategory)
                            .orangeBirdTitle1()
                            .foregroundStyle(Color.gray8)
                    }
                    Text("이에요.")
                        .orangeBirdBody1()
                        .foregroundStyle(Color.gray7)
                }
            }
            
            Spacer()
            Circle()
                .frame(width: 100)
            
            Image(systemName: "chevron.forward")
                .orangeBirdTitle2()
                .foregroundStyle(Color.gray6)
        }
        .padding(.all, 12)
        .background(Color.gray3)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private func recentActiviesSection() -> some View {
        
        var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
        
        VStack(spacing: 16) {
            HStack(alignment: .center, spacing: 0) {
                Text("나의 최근 활동")
                    .orangeBirdTitle1()
                    .foregroundStyle(Color.gray8)
                Spacer()
                Button {
                    //더보기 버튼 액션 삽입
                } label: {
                    Text("더보기")
                        .orangeBirdBody2()
                        .foregroundStyle(Color.gray7)
                }
            }
            LazyVGrid(columns: columns, alignment: .listRowSeparatorLeading, spacing: 8) {
                Rectangle()
                    .frame(minHeight: 100)
                Rectangle()
                    .frame(minHeight: 100)
                Rectangle()
                    .frame(minHeight: 100)
                Rectangle()
                    .frame(minHeight: 100)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    usearthHomeView()
}
