//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Autthawigorn Yortpiboot on 25/3/2567 BE.
//

import SwiftUI


struct ContentView: View {
    
    let choices = Choices()
    
    
    @State private var condition = Condition()
    @State private var imageQuestion = "rock" // Initial value to avoid nil
    @State private var score = 0
    @State private var round = 1
    @State private var showAlert = false
    @State private var scoreIncrement = 0
    @State private var alertTitle = ""
    @State private var selectedAnswerForAlert = ""
    @State private var isAlertDismissed = false
    
    
    
    var body: some View {
        
        // var imageQuestion = choices.choicesImage.first ?? "No Image"
        
        ZStack {
            Color.black
            
            VStack (spacing:30){
                Image(imageQuestion)
                    .resizable()
                    .frame(maxWidth: 200,maxHeight: 200)
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.yellow)
                
                condition.generateCondition()
                
                
                choices.choicesButton { selected in
                    checkAnswer(selectedAnswer: selected)
                    showAlert = true
                    //  refreshData()
                    
                }
                
                .padding()
                Text("Rounds: \(round)/10")
                    .foregroundColor(.white)
                Text("Your Scores: \(score)")
                    .foregroundColor(.white)
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
        
        
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Continue") {
                //checkForTitle()
                isAlertDismissed = true
                refreshData()
            }
        } message: {
            alertTitle == "Good Job" ? Text("You Got 1 Point")
            : alertTitle == "Game Over" ? Text("Your final score is \(score)")
            : Text("\(selectedAnswerForAlert.capitalized) wasn't \(condition.randomCondition.capitalized) \(imageQuestion.capitalized)")
        }
        .onAppear(){
            checkForTitle()
        }
        
        .onChange(of: isAlertDismissed) { dismissed in
            if dismissed {
                round += 1 // Increment round when the alert is dismissed
                resetRound()
                isAlertDismissed = false // Reset the state after incrementing round
            }
        }
    }
    
    func checkForTitle() {
        
        alertTitle = round == 10 ? "Game Over"
        : scoreIncrement > 0 ? "Good Job"
        : "Try Again"
    }
    
    func resetRound() {
        round = round > 10 ? 1 : round
    }
    
    func refreshData() {
        var newImageQuestion = imageQuestion
        while newImageQuestion == imageQuestion {
            newImageQuestion = choices.choicesImage.randomElement() ?? "No Image"
        }
        imageQuestion = newImageQuestion
        
        condition = Condition() // update condition
        
        score = round == 10 ? 0 : score
        
    }
    
    func checkAnswer(selectedAnswer: String)  {
        
        let currentCondition = condition.conditions.first ?? "No questions available."
        print("Selected Answer: \(selectedAnswer), Current Condition: \(currentCondition), Image Question: \(imageQuestion)") // test conddition output
        
        switch (selectedAnswer, currentCondition, imageQuestion) {
            
        case ("rock", "win", "rock"): scoreIncrement = 0
        case ("rock", "lose", "rock"): scoreIncrement = 0
        case ("rock", "win", "paper"): scoreIncrement = 0
        case ("rock", "lose", "paper"): scoreIncrement = 1
        case ("rock", "win", "scissors"): scoreIncrement = 1
        case ("rock", "lose", "scissors"): scoreIncrement = 0
            
        case ("paper", "win", "rock"): scoreIncrement = 1
        case ("paper", "lose", "rock"): scoreIncrement = 0
        case ("paper", "win", "paper"): scoreIncrement = 0
        case ("paper", "lose", "paper"): scoreIncrement = 0
        case ("paper", "win", "scissors"): scoreIncrement = 0
        case ("paper", "lose", "scissors"): scoreIncrement = 1
            
        case ("scissors", "win", "rock"): scoreIncrement = 0
        case ("scissors", "lose", "rock"): scoreIncrement = 1
        case ("scissors", "win", "paper"): scoreIncrement = 1
        case ("scissors", "lose", "paper"): scoreIncrement = 0
        case ("scissors", "win", "scissors"): scoreIncrement = 0
        case ("scissors", "lose", "scissors"): scoreIncrement = 0
            
        default: scoreIncrement = 0
        }
        
        if scoreIncrement > 0 {
            score += scoreIncrement // Update the score
            print("You got \(scoreIncrement) point")
        } else {
            print("You got 0 point")
        }
        
        checkForTitle() // Call checkForTitle to update alertTitle
        selectedAnswerForAlert = selectedAnswer
    }
    
}



#Preview {
    ContentView()
}
