//
//  ContentView.swift
//  HotProspects
//
//  Created by Autthawigorn Yortpiboot on 13/6/2567 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SortableProspectsView(filter: .none)
                    .tabItem {
                        Label("Everyone", systemImage: "person.3")
                    }
            SortableProspectsView(filter: .contacted)
                    .tabItem {
                        Label("Contacted", systemImage: "checkmark.circle")
                    }
            SortableProspectsView(filter: .uncontacted)
                    .tabItem {
                        Label("Uncontacted", systemImage: "questionmark.diamond")
                    }
                MeView()
                    .tabItem {
                        Label("Me", systemImage: "person.crop.square")
                    }
        }
    }
}

#Preview {
    ContentView()
}
