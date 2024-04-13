//
//  AddView.swift
//  iExpense
//
//  Created by Autthawigorn Yortpiboot on 12/4/2567 BE.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount: Double? = nil
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    // Get the currency code from the user's locale
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text:$name)
                Picker("Type", selection: $type) {
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount ?? 0)
                    expenses.items.append(item)
                        dismiss()
                }
            }
        }
    }
    
    
    
}

#Preview {
    AddView(expenses: Expenses())
}
