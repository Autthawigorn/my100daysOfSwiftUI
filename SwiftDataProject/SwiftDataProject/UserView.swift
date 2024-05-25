//
//  UserView.swift
//  SwiftDataProject
//
//  Created by Autthawigorn Yortpiboot on 24/5/2567 BE.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        List(users) { user in
            VStack(alignment:.leading) {
                HStack {
                    Text(user.name)
                    
                    Spacer()
                    
                    Text(String(user.jobs.count))
                        .fontWeight(.black)
                        .padding(10)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.circle)
                }
                
                Text(dateFormatter.string(from: user.joinDate))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .onAppear(perform: addSample)
    }
       
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
        
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)
        
        modelContext.insert(user1)
        
        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
