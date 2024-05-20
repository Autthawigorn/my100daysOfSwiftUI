//
//  TestSwiftDataApp.swift
//  TestSwiftData
//
//  Created by Autthawigorn Yortpiboot on 18/5/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct TestSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
