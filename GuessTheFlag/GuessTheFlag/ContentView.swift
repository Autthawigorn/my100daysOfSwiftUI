//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Autthawigorn Yortpiboot on 23/3/2567 BE.
//

import SwiftUI

// ---- project 3 - challenge 2 ----
struct FlagImage: View {
    var countryName: String
    
    var body: some View {
        Image(countryName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
//----
struct ContentView: View {
    

    @State private var country = ["Estonia", "France", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswerIndex = Int.random(in: 0...2)
    
    @State private var buttonPressedIndex = -555 // Initialize to an invalid index
    
    @State private var alertTitle = ""
    @State private var showAlert = false // State to control the alert presentation
    
    @State private var rounds = 0
    @State private var scores = 0
    @State private var shouldRefreshView = false // Flag to control view refresh
    
    var body: some View {
        
        ZStack {
            
            RadialGradient(gradient: Gradient(colors: [Color.pink, Color.mint]), center: .center, startRadius: 5, endRadius: 600)
                .ignoresSafeArea()
            
            LinearGradient(stops: [
                .init(color: .yellow, location: 0),
                .init(color: .purple, location: 1),
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            .opacity(0.3)
            .background(.ultraThinMaterial)
            
            VStack{
                
                Text("\(country[correctAnswerIndex])")
                    .font(.title)
                    .bold()
                
                if rounds < 10 {
                    ForEach (0..<3) { index in
                        Button {
                            buttonPressedIndex = index // Update the button pressed index
                            yourAnswerIs()
                            scores = (buttonPressedIndex == correctAnswerIndex) ? scores + 1 : scores
                        } label: {
                            FlagImage(countryName: "\(country[index])")  // ---- project 3 - challenge 2 ----
                        }
                        .padding()
                    }
                    
                    Text("Rounds: \(rounds)/10")
                    Text("Scores: \(scores)")
                }
                
            }
            .opacity(rounds < 10 ? 1 : 0) // Hide the VStack when rounds reach 10
            
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Continue") {
                shouldRefreshView = true
            }
        }
        .onChange(of: shouldRefreshView) { endGame in
            if endGame {
               refreshView()
                shouldRefreshView = false
                scores = (rounds == 10) ? 0 : scores
                rounds = (rounds == 10) ? 0 : rounds
 
            }

        }
        
    }
    
    func yourAnswerIs() {
        alertTitle = (buttonPressedIndex == correctAnswerIndex) ? "ถูกต้องนะค้าบบบ" : "เสียใจด้วยนะน้อนนน"
        showAlert = true
        rounds += 1
    }
    
    func refreshView() {
        country.shuffle()
        correctAnswerIndex = Int.random(in: 0...2)
        buttonPressedIndex = -666 // Reset the pressed button index
    }
    
    func roundsReset() {
        alertTitle = (rounds == 10) ? "จ๋อได้คะแนน \(scores)" : alertTitle
    }
}




#Preview {
    ContentView()
}
