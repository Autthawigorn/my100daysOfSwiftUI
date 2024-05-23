//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Autthawigorn Yortpiboot on 22/5/2567 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false
    
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    var sortOrderLabel: String {
        sortOrder.first == SortDescriptor(\User.name) ? "Name" : "Date"
    }
    
    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
                .navigationTitle("Users")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Add Sample", systemImage: "plus") {
                            try? modelContext.delete(model: User.self)
                            
                            let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                            let second = User(name: "Rose Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                            let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                            let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                            
                            modelContext.insert(first)
                            modelContext.insert(second)
                            modelContext.insert(third)
                            modelContext.insert(fourth)
                        }
                        Button(showingUpcomingOnly ? "Show All" : "Upcoming") {
                            showingUpcomingOnly.toggle()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Sort by Name")
                                    .tag([
                                        SortDescriptor(\User.name),
                                        SortDescriptor(\User.joinDate)
                                    ])
                                Text("Sort by Join Date")
                                    .tag([
                                        SortDescriptor(\User.joinDate),
                                        SortDescriptor(\User.name)
                                    ])
                            }
                        } label: {
                            HStack {
                                Label(sortOrderLabel, image: sortOrder.first?.keyPath == \User.name ? "custom1" : "custom2")
                                    .frame(width: 60, height: 60, alignment: .trailing)
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
