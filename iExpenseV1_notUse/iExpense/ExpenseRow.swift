//
//  ExpenseRow.swift
//  iExpense
//
//  Created by Autthawigorn Yortpiboot on 22/4/2567 BE.
//

import SwiftUI

struct ExpenseRow: View {
    
    var item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name.isEmpty ? "Untitled" : item.name)
                    .font(.headline)
                Text(item.type)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundColor(colorForAmount(item.amount))
        }
    }
}


func colorForAmount(_ amount: Double) -> Color {
    switch amount {
    case 0:
        return .gray.opacity(0.7)
    case 1...50:
        return .orange.opacity(0.7)
    case 51...100:
        return .pink.opacity(0.7)
    default:
        return .red
    }
}


struct ExpenseRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ExpenseRow(item: ExpenseItem(name: "Test", type: "Personal", amount: 50.0))
            ExpenseRow(item: ExpenseItem(name: "Test", type: "Personal", amount: 100.0))
        }
    }
}
