//
//  ContentView.swift
//  BucketList
//
//  Created by Autthawigorn Yortpiboot on 30/5/2567 BE.
//

import SwiftUI

struct User: Identifiable {
    
    let id = UUID()
    var firstName: String
    var lastName: String
    let dateOfBirth: Date // Assuming you have a date property

   func calculateAge(for user: User) -> Int { // static
        let now = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: user.dateOfBirth, to: now)
        return ageComponents.year ?? 0
    }
}

struct UserView: View {
    let user: User

    var body: some View {
        VStack {
            Text("Name: \(user.firstName) \(user.lastName)")
            Text("Age: \(user.calculateAge(for: user))") // Call the static function
        }
    }
}



struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
