//
//  ExpenseItem.swift
//  iExpense_SwiftData
//
//  Created by Autthawigorn Yortpiboot on 26/5/2567 BE.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
