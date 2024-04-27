//
//  ContentView.swift
//  HabitTracker
//
//  Created by Autthawigorn Yortpiboot on 24/4/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activities = Activities()
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items) { item in
                    Section {
                        NavigationLink {
                            DetailView(activityItem: item)
                        } label: {
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.title)
                                            .font(.title)
                                            .bold()
                                        Text(item.category)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    Text(String(item.amount))
                                        .font(.headline)
                                        .foregroundStyle(.green)
                                }
                                Divider()
                                HStack {
                                    Text(item.detail)
                                        .lineLimit(1, reservesSpace: false)
                                }
                            }
                        }
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add Activity")
                        }
                        .foregroundColor(.purple)
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                AddView(activities: activities)
            }
        }
        }
    
    func removeItem(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
