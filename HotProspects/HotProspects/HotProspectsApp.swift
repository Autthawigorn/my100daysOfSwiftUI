//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Autthawigorn Yortpiboot on 13/6/2567 BE.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
