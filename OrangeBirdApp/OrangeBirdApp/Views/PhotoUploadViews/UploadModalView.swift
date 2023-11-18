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
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                RoundedRectangle(cornerRadius: 12)
                RoundedRectangle(cornerRadius: 12)
            }
            HStack(alignment: .center, spacing: 8) {
                RoundedRectangle(cornerRadius: 12)
                RoundedRectangle(cornerRadius: 12)
            }
        }
        .padding(.bottom, 44)
    }
}

