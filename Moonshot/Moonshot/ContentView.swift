//
//  ContentView.swift
//  Moonshot
//
//  Created by Autthawigorn Yortpiboot on 15/4/2567 BE.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    let astronautsDictionary: [String: Astronauts] = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        List {
            // Display count of astronauts
            Text("Number of Astronauts: \(astronauts.count)")
            Text("Number of xx: \(astronautsDictionary.count)")
            
            
            ForEach(astronautsDictionary.sorted(by: { $0.key < $1.key }), id: \.key) { (dummyKey, astronaut) in
                Text("ID:\(astronaut.id)")
                Text("Name: \(astronaut.name)")
                Text("Description: \(astronaut.description)")
                    .padding()
            }
        }
    }
}
#Preview {
    ContentView()
}
