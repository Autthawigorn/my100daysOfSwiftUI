//
//  Model.swift
//  HabitTracker
//
//  Created by Autthawigorn Yortpiboot on 25/4/2567 BE.
//

import Foundation

struct ActivityItem: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    let category: String
    let detail: String
    let amount: Int
}

@Observable
class Activities {
   // var items = [ActivityItem]()
    
    var items = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
    
}
