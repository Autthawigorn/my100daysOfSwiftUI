//
//  Model.swift
//  iExpense
//
//  Created by Autthawigorn Yortpiboot on 22/4/2567 BE.
//

import Foundation


struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Dummy")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Dummy") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
