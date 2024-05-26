//
//  View-ExpenseStyle.swift
//  iExpense_SwiftData
//
//  Created by Autthawigorn Yortpiboot on 26/5/2567 BE.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        switch item.amount {
        case 0:
            return self.foregroundColor(.gray.opacity(0.7))
        case 1...50:
            return self.foregroundColor(.orange.opacity(0.7))
        case 51...100:
            return self.foregroundColor(.pink.opacity(0.7))
        default:
            return self.foregroundColor(.red)
        }
    }
}

