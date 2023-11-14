//
//  OrangeBirdAppApp.swift
//  OrangeBirdApp
//
//  Created by HanGyeongjun on 11/13/23.
//

import SwiftUI
import SwiftData
import FirebaseCore

@main
struct OrangeBirdAppApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    //Firebase setup을 위한 app delegate 파일 등록
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
