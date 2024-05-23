//
//  ContentView.swift
//  TestSwiftDataProject12
//
//  Created by Autthawigorn Yortpiboot on 22/5/2567 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                        Text(user.city)
                            .font(.caption)
                        Text("\(user.joinDate)")
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                }
            }
        }
    }
}

