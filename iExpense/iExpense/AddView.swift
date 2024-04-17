//
//  AddView.swift
//  iExpense
//
//  Created by Autthawigorn Yortpiboot on 12/4/2567 BE.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiiisss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    // Get the currency code from the user's locale
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    var isSaveDisabled: Bool {
        amount.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiiisss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        
                        let item = ExpenseItem(name: name, type: type, amount: Double(amount) ?? 0.0)
                        expenses.items.append(item)
                        dismiiisss()
                        }
                    
                    .disabled(isSaveDisabled)
                }
                
            }
        }
    }
}



#Preview {
    AddView(expenses: Expenses())
}
