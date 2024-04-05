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
    
    @State private var rounds = 1
    @State private var scores = 0
    @State private var shouldRefreshView = false // Flag to control view refresh
    
    @State private var rotateAmount = [0.0, 0.0, 0.0]  // project 6 - challenge 1
    @State private var opacityAmount = [1.0, 1.0, 1.0] // project 6 - challenge 2
    @State private var scaleAmount = [1.0, 1.0, 1.0]   // project 6 - challenge 3
    
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
                

                    ForEach (0..<3) { index in
                        Button {
                            
                            flagAnimation(index:index)
                            buttonPressedIndex = index // Update the button pressed index
                            checkAnswer()
                       
                            scores = (buttonPressedIndex == correctAnswerIndex) ? scores + 1 : scores
                            alertTitle = (rounds == 10) ? "Your score is \(scores)" : alertTitle
                            
                            
                        } label: {
                            FlagImage(countryName: "\(country[index])")  // ---- project 3 - challenge 2 ----
                        }
                        .rotation3DEffect(Angle(degrees: rotateAmount[index]), axis: (x: 0, y: 1, z: 0)) // project 6 - challenge 1
                        .opacity(opacityAmount[index])     // project 6 - challenge 2
                        .scaleEffect(scaleAmount[index])   // project 6 - challenge 3
                        .animation(.default, value: scaleAmount)
                        .padding()
                    }
                    
                    Text("Rounds: \(rounds)/10")
                    Text("Scores: \(scores)")

                
            }

            
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Continue") {
                refreshView()
                roundsReset()
            }
        }
        
    }
    
    func flagAnimation(index: Int) {
        // project 6 - challenge 1
        withAnimation {
            rotateAmount[index] += 360
        }
        
        // project 6 - challenge 2 and 3
        withAnimation {
            for notTapped in 0..<3 where notTapped != index {
                opacityAmount[notTapped] = 0.25
                scaleAmount[notTapped] = 0.85
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                showAlert = true // Present the alert after the animation ends
            }

    }
    
    func checkAnswer() {
        alertTitle = (buttonPressedIndex == correctAnswerIndex) ? "Right" : "Wrong"
       
    }
    
    func refreshView() {
        country.shuffle()
        correctAnswerIndex = Int.random(in: 0...2)
        buttonPressedIndex = -666 // Reset the pressed button index
        opacityAmount = [1.0, 1.0, 1.0] // Reset opacity
        scaleAmount = [1.0, 1.0, 1.0]   // Reset scale
        rounds += 1
    }
    
    func roundsReset() {
        scores = (rounds > 10) ? 0 : scores
        rounds = (rounds > 10) ? 1 : rounds
    }
}




#Preview {
    ContentView()
}
