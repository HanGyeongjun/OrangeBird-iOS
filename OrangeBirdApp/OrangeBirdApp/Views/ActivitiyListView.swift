//
//  ActivitiyListView.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/19/23.
//

import SwiftUI
import SwiftData

struct ActivitiyListView: View {
    @Environment(\.modelContext) private var modelContext
//    @Query private var activities: [Activity]
    @Query(sort: \Activity.date, order: .reverse) private var activities: [Activity]
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, alignment: .listRowSeparatorLeading, spacing: 8) {
                ForEach(activities) { activity in
                    ActivityCell(activity: activity)
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 44)
            .padding(.horizontal, 16)
        }
        .navigationTitle("나의 활동")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.orangeBirdBackground)
    }
}

#Preview {
    ActivitiyListView()
}
