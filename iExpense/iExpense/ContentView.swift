//
//  ContentView.swift
//  iExpense
//
//  Created by Autthawigorn Yortpiboot on 11/4/2567 BE.
//

import SwiftUI

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

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
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
                    Button(action: {
                        showingAddExpense = true
                    }) {
                        Label("Add Expense", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
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
        return Color.gray.opacity(0.7)
    case 1...50:
        return Color.orange.opacity(0.7)
    case 51...100:
        return Color.pink.opacity(0.7)
    default:
        return Color.red
    }
}



#Preview {
    ContentView()
}
