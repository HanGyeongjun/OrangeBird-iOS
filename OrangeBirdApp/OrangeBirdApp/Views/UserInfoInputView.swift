//
//  UserInfoInputView.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/19/23.
//

import SwiftUI
import SwiftData

struct UserInfoInputView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var user: [User]
    
    @Binding var isRegister: Bool
    @State private var username = ""
    @State private var isInvalidInput = false
    @State private var isMaxCharacterExceeded = false
    
    @State private var selectedPrefix: DesignationPrefix = .plogging
    @State private var selectedSuffix: DesignationSuffix = .environSafer
    
    let maxCharacterCount = 6
    
    let tags = ["Tag1", "Tag2", "Tag3", "Tag4"] // 여러 텍스트 태그들
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Image("Logo.Eng.Horizontal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                
                Text("어스,어스와 함께하기 위해\n닉네임을 입력해주세요")
                    .orangeBirdTitle1()
                    .foregroundStyle(Color.gray8)
                    .multilineTextAlignment(.leading)
                
                // 1. 최상단에 사용자 닉네임을 입력하는 텍스트필드
                TextField("닉네임을 입력하세요.", text: $username)
                    .orangeBirdBody2()
                    .foregroundStyle(Color.gray7)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(lineWidth: 1)
                            .foregroundStyle(Color.gray4)
                    )
                    .lineLimit(2)
                    .onChange(of: username) { newValue in
                        // 2. 이 텍스트필드에 공백 또는 특수문자를 입력하면 경고 표시
                        isInvalidInput = !newValue.isEmpty && !isValidInput(newValue)
                        
                        // 3. 이 텍스트필드에는 최대 6자까지만 입력 가능
                        isMaxCharacterExceeded = newValue.count > maxCharacterCount
                        if isMaxCharacterExceeded {
                            username = String(newValue.prefix(maxCharacterCount))
                        }
                    }
                    .alert(isPresented: $isInvalidInput) {
                        Alert(
                            title: Text("Invalid Input"),
                            message: Text("한글 또는 영어만 입력할 수 있어요."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    .alert(isPresented: $isMaxCharacterExceeded) {
                        Alert(
                            title: Text("Character Limit Exceeded"),
                            message: Text("6자까지만 입력할 수 있어요."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                
                // DesignationPrefix 선택
                Picker("Select Designation Prefix", selection: $selectedPrefix) {
                    ForEach(DesignationPrefix.allCases, id: \.self) { prefix in
                        Text(prefix.rawValue).tag(prefix)
                    }
                }
                .frame(height: 144)
                .pickerStyle(WheelPickerStyle())

                // DesignationSuffix 선택
                Picker("Select Designation Suffix", selection: $selectedSuffix) {
                    ForEach(DesignationSuffix.allCases, id: \.self) { suffix in
                        Text(suffix.rawValue).tag(suffix)
                    }
                }
                .frame(height: 144)
                .pickerStyle(WheelPickerStyle())
                
                Text("안녕!\n\(selectedPrefix.rawValue)하는 \(selectedSuffix.rawValue).\n\(username)")
                    .orangeBirdTitle1()
                    .foregroundStyle(Color.gray8)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 32)
                
                Button {
                    modelContext.insert(User(username: username, designationPrefix: selectedPrefix, desionationSuffix: selectedSuffix))
                    self.isRegister = true
                } label: {
                    Text("us,earth 시작하기")
                        .orangeBirdHeadline()
                        .foregroundStyle(Color.alwaysWhite)
                        .frame(width: UIScreen.screenWidth-32, height: 60)
                        .background(Color.usEarthPrimary)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .padding(.top, 40)
            .padding(.horizontal, 16)
        }
        .background(Color.gray2)
    }
    
    // 입력값이 한글 또는 영어인지 확인하는 함수
    private func isValidInput(_ input: String) -> Bool {
        let pattern = "^[a-zA-Z가-힣]*$"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: input)
    }
}

//#Preview {
//    UserInfoInputView()
//}
