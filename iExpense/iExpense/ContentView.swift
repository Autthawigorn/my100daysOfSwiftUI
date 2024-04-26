//
//  ContentView.swift
//  iExpense
//
//  Created by Autthawigorn Yortpiboot on 11/4/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                if !personalExpenses.isEmpty {
                    Section(header: Text("Personal")) {
                        ForEach(personalExpenses) { item in
                            ExpenseRow(item: item)
                        }
                        .onDelete(perform: deletePersonalExpense)
                    }
                }
                
                if !businessExpenses.isEmpty {
                    Section(header: Text("Business")) {
                        ForEach(businessExpenses) { item in
                            ExpenseRow(item: item)
                        }
                        .onDelete(perform: deleteBusinessExpense)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink("+ (Try use NavigationLink)") {
                        AddView(expenses: expenses, showSheet: $showSheet) // $showSheet = false. to hide Cancel button
                    }
                }
                
            }
            
            .sheet(isPresented: $showSheet) {
                AddView(expenses: expenses, showSheet: $showSheet)
            }
            
        }
    }
    
    var personalExpenses: [ExpenseItem] {
        return expenses.items.filter { item in
            item.type == "Personal"
        }
    } // try full trailing closure format
    
    var businessExpenses: [ExpenseItem] {
        return expenses.items.filter { $0.type == "Business" }
    }
    
    func deletePersonalExpense(at offsets: IndexSet) {
        for index in offsets {
            if let itemIndex = expenses.items.firstIndex(of: personalExpenses[index]) {
                expenses.items.remove(at: itemIndex)
            }
        }
    }
    
    func deleteBusinessExpense(at offsets: IndexSet) {
        for index in offsets {
            if let itemIndex = expenses.items.firstIndex(of: businessExpenses[index]) {
                expenses.items.remove(at: itemIndex)
            }
        }
    }
}



#Preview {
    ContentView()
}
