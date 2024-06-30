//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Autthawigorn Yortpiboot on 26/6/2567 BE.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player
    
    var body: some View {
        @Bindable var player = player
        
        Stepper("High Score: \(player.highScore)", value: $player.highScore)
    }
}

struct ContentView: View {
    @State private var dummy = Player()
    
    var body: some View {
        VStack {
            Text("Welcome!")
            HighScoreView()
        }
        .environment(dummy)
    }
}




#Preview {
    ContentView()
}
