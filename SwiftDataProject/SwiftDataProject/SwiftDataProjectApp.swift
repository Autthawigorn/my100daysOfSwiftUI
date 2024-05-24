//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Autthawigorn Yortpiboot on 24/5/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
