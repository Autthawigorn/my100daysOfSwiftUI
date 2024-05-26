//
//  ContentView.swift
//  iExpense_SwiftData
//
//  Created by Autthawigorn Yortpiboot on 26/5/2567 BE.
//


import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    @State private var expenseType = "All"
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    var body: some View {
        NavigationStack {
            ExpensesList(type: expenseType ,sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                    
                    Menu("Filler", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Filter", selection: $expenseType) {
                            Text("Show All Expenses")
                                .tag("All")
                            
                            Divider()
                            
                            ForEach(AddView.types, id: \.self) { type in
                                Text(type)
                                    .tag(type)
                            }
                        }
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort By", selection: $sortOrder) {
                            
                            Text("Name (A-Z)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            
                            Text("Name (Z-A)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name, order: .reverse),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            
                            Text("Amount (Cheapest First)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                            
                            Text("Amount (Most Expensive First)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount, order: .reverse),
                                    SortDescriptor(\ExpenseItem.name),
                                ])
                            
                        }
                    }
                    .sheet(isPresented: $showingAddExpense) {
                        AddView()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
