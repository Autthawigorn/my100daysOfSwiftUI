//
//  ContentView.swift
//  ViewModifierProject3Challenge3
//
//  Created by Autthawigorn Yortpiboot on 25/3/2567 BE.
//

import SwiftUI

struct BlueTitle: ViewModifier {
    func body(content:Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.blue)
    }
}

extension View {
    func makeItBlueTitle() -> some View {
        modifier(BlueTitle())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .makeItBlueTitle()
            Text("Hello, world!")
                .makeItBlueTitle()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
