//
//  ExpenseSection.swift
//  iExpenseV2
//
//  Created by Autthawigorn Yortpiboot on 26/5/2567 BE.
//

import SwiftUI

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        if !expenses.isEmpty {
            Section(title) {
                ForEach(expenses) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: localCurrency))
                            .style(for: item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
        }
    }
}

#Preview {
    ExpenseSection(title: "Personal", expenses: []) { _ in
        
    }
}

