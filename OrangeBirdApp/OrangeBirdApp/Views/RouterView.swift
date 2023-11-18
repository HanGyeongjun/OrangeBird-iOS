//
//  RouterView.swift
//  OrangeBirdApp
//
//  Created by hello on 11/19/23.
//

import SwiftUI
import SwiftData

struct RouterView: View {    
    @State var isRegister: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Query private var user: [User]
    
    var body: some View {
        if !isRegister && user.isEmpty {
            UserInfoInputView(isRegister: $isRegister)
        } else {
            usearthHomeView()
        }
    }
}

#Preview {
    RouterView()
}
