//
//  AddView.swift
//  HabitTracker
//
//  Created by Autthawigorn Yortpiboot on 25/4/2567 BE.
//

import SwiftUI

struct AddView: View {
    
    @Environment (\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var category = "Study"
    @State private var amount = ""
    @State private var detail = ""
    
    var activities = Activities()
    
    let categories = ["Study", "Sport", "Eat"]
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Activity Title", text: $title)
                }
                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                    }
                }
                
                Section {
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                }
                
                Section {
                    TextField("Details", text: $detail, axis: .vertical)
                    //.textFieldStyle(.roundedBorder)
                        .lineLimit(5, reservesSpace: false)
                }
            }
            .navigationTitle("Add Activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if title.isEmpty {
                            title = "Untitled"
                        }
                        let item = ActivityItem(title:title, category: category, detail: detail, amount: Int(amount) ?? 0)
                        
                        activities.items.append(item)
                        dismiss()
                    }
                }
            }
        }
    }
}



#Preview {
    AddView()
}
