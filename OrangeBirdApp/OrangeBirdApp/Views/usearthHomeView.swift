//
//  usearthHomeView.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/18/23.
//

import SwiftUI
import Charts

struct usearthHomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        profileSection(profileImage: nil, userName: "유저이름", designation: "플로깅안하는 환경파괴자")
                        
                        levelSection(level: 3, levelDescription: "일해라 휴먼 일해라 휴먼 일해라 휴먼 일해라 휴먼")
                        
                        pieChartSection(mostDidCategory: "플로깅")
                        
                        recentActiviesSection()
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 44)
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
                            .aspectRatio(contentMode: .fit)
                            .fontWeight(.bold)
                            .frame(width: 32, height: 32)
                            .foregroundStyle(Color.alwaysWhite)
                    }
                }
                .padding(.all, 16)
            }
            .background(Color.orangeBirdBackground)
            .navigationTitle("us,earth🌲")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    @ViewBuilder
    private func profileSection(profileImage: Image?, userName: String, designation: String) -> some View {
        HStack(spacing: 16) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
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
                .foregroundStyle(Color.alwaysWhite)
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
        
        var coffeeSales = [
            (color: Color.usEarthPrimary , name: "Americano", count: 120),
            (color: Color.gray5 , name: "Cappuccino", count: 234),
            (color: Color.gray5 , name: "Espresso", count: 62),
            (color: Color.gray5 , name: "Latte", count: 625),
        ]

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
            Chart {
                ForEach(coffeeSales, id: \.name) { coffee in
                    SectorMark(
                        angle: .value("Cup", coffee.count),
                        innerRadius: .ratio(0.6),
                        angularInset: 0.6
                    )
                    .cornerRadius(2)
                }
            }
            .chartForegroundStyleScale([
                "Americano": Color.usEarthPrimary,
                "Cappuccino": Color.gray5,
                "Espresso": Color.gray5,
                "Latte": Color.gray5
            ])
            .chartLegend(.hidden)
            .frame(width: 100, height: 100)
            
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
        
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
        
        VStack(spacing: 16) {
            HStack(alignment: .center, spacing: 0) {
                Text("나의 최근 활동")
                    .orangeBirdTitle1()
                    .foregroundStyle(Color.gray8)
                Spacer()
                NavigationLink(destination: ActivitiyListView()) {
                    Text("더보기")
                        .orangeBirdBody2()
                        .foregroundStyle(Color.gray7)
                }
//                Button {
//                    //더보기 버튼 액션 삽입
//                } label: {
//                    Text("더보기")
//                        .orangeBirdBody2()
//                        .foregroundStyle(Color.gray7)
//                }
            }
            LazyVGrid(columns: columns, alignment: .listRowSeparatorLeading, spacing: 8) {
                ForEach (0..<4) {_ in
                    ActivityCell()
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    usearthHomeView()
}
