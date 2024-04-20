//
//  ContentView.swift
//  Moonshot
//
//  Created by Autthawigorn Yortpiboot on 15/4/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showGridLayout = true
    
    var body: some View {
        NavigationStack {
            
            Group {
                if showGridLayout == true {
                    GridLayout()
                } else {
                    ListLayout()
                }
            }
            
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    withAnimation {
                        showGridLayout.toggle()
                    }
                } label: {
                    Image(systemName: showGridLayout ? "rectangle.grid.1x2" : "rectangle.grid.2x2")
                }

            }
        }
    }
}


#Preview {
    ContentView()
        .accentColor(.red)
}

