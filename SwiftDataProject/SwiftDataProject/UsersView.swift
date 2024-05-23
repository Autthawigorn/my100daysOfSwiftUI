//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Autthawigorn Yortpiboot on 22/5/2567 BE.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            VStack(alignment:.leading) {
                Text(user.name)
                Text("\(user.joinDate)")
                    .font(.caption)
            }
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
