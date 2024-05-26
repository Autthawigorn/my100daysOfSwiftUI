//
//  ExpensesList.swift
//  iExpense_SwiftData
//
//  Created by Autthawigorn Yortpiboot on 26/5/2567 BE.
//

import SwiftData
import SwiftUI

struct ExpensesList: View {
    @Environment(\.modelContext) var modelContext
    @Query private var expenses: [ExpenseItem]

    let localCurrency = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
            List {
                ForEach(expenses) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: localCurrency))
                            .style(for: item)
                    }
                }
                .onDelete(perform: removeItems)
            }
    }
//    init(sortOrder: [SortDescriptor<ExpenseItem>]) {
//        _expenses = Query(sort: sortOrder)
//    }
    
    init(type: String = "All", sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate {
            if type == "All" {
                return true
            } else {
                return $0.type == type
            }
        }, sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
            }
        }
    }


#Preview {
    ExpensesList(sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}

