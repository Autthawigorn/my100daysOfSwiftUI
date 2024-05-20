//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Autthawigorn Yortpiboot on 18/5/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
