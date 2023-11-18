//
//  usearthHomeView.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/18/23.
//

import SwiftUI
import SwiftData
import Charts

struct usearthHomeView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var user: [User]
    @Query(sort: \Activity.date, order: .reverse) private var activities: [Activity]
//    private var user = User(username: "홍길동", designationPrefix: .ecoStuff, desionationSuffix: .niceConsumer)

    @State var isShowModal = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        if user.count != 0{
                            let userLevel = user[0].getLevel(currentExp: activities.count)
                            profileSection(profileImage: nil, userName: user[0].username, designation: user[0].desionationSuffix.rawValue)
                            levelSection(level: userLevel.rawValue, levelDescription: userLevel.description())
                            
                            let numbers = user[0].activityNumbers(activities: activities)
                            pieChartSection(categoryCount: numbers, maxIndex: user[0].mostIndex(sum: numbers))
                            
                            recentActiviesSection()
                        } else {
                            Button(action: {
                                modelContext.insert(User(username: "홍길동", designationPrefix: .diy, desionationSuffix: .earthSafer))
                                modelContext.insert(Activity(category: .diy, memo: "diy했음", currentLevel: 1))
                                modelContext.insert(Activity(category: .diy, memo: "diy했음2", currentLevel: 1))
                                modelContext.insert(Activity(category: .diy, memo: "diy했음3", currentLevel: 1))
                                modelContext.insert(Activity(category: .diy, memo: "diy했음4", currentLevel: 1))
                                modelContext.insert(Activity(category: .ecoStuff, memo: "ecoStuff햇", currentLevel: 1))
                                modelContext.insert(Activity(category: .ecoStuff, memo: "ecoStuffgoT", currentLevel: 1))
                                modelContext.insert(Activity(category: .plogging, memo: "plogging asdf", currentLevel: 1))
                                modelContext.insert(Activity(category: .recycle, memo: "recycle asdfdii", currentLevel: 1))
                                modelContext.insert(Activity(category: .plogging, memo: "plogging gogo", currentLevel: 1))
                                modelContext.insert(Activity(category: .plogging, memo: "plogging gogo", currentLevel: 1))
                            }, label: {
                                Text("Button")
                                
                            })
                        }
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 44)
                }
                Button {
                    isShowModal.toggle()
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
        .sheet(isPresented: self.$isShowModal) {
            UploadModalView(isShowModal: self.$isShowModal)
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
                
                    .frame(
                        width: (progressBarWidth/CGFloat(getExp(level: level) - getExp(level: level-1))) * CGFloat((activities.count - getExp(level: level-1))),
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
    private func pieChartSection(categoryCount : [Int], maxIndex: Int) -> some View {
        var coffeeSales = [
            (color: maxIndex == 0 ? Color.usEarthPrimary : Color.gray5 , name: "ecoStuff", count: categoryCount[0]),
            (color: maxIndex == 1 ? Color.usEarthPrimary : Color.gray5 , name: "diy", count: categoryCount[1]),
            (color: maxIndex == 2 ? Color.usEarthPrimary : Color.gray5 , name: "recycle", count: categoryCount[2]),
            (color: maxIndex == 3 ? Color.usEarthPrimary : Color.gray5 , name: "plogging", count: categoryCount[3])
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
                        Text(categoryCount[maxIndex] == 0 ? "" : getActivityType(index: maxIndex).koreanTitle())
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
                coffeeSales[0].name: coffeeSales[0].color,
                coffeeSales[1].name: coffeeSales[1].color,
                coffeeSales[2].name: coffeeSales[2].color,
                coffeeSales[3].name: coffeeSales[3].color,
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
//                let max = activities.count > 4 ? 4 : activities.count
//                ForEach (activities) { index, activity in
//                    if index < 4 {
//                        ActivityCell(activity: activity)
//                    }
//                }
                
//                var acts = activities.reversed()
                if activities.count == 1 {
                    ActivityCell(activity: activities[0])
                }
                else if activities.count == 2 {
                    ActivityCell(activity: activities[0])
                    ActivityCell(activity: activities[1])
                }
                else if activities.count == 3 {
                    ActivityCell(activity: activities[0])
                    ActivityCell(activity: activities[1])
                    ActivityCell(activity: activities[2])
                }
                else if activities.count != 0 {
                    ActivityCell(activity: activities[0])
                    ActivityCell(activity: activities[1])
                    ActivityCell(activity: activities[2])
                    ActivityCell(activity: activities[3])
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    usearthHomeView()
}
