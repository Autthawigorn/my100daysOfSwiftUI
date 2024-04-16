//
//  ContentView.swift
//  Edutainment
//
//  Created by Autthawigorn Yortpiboot on 13/4/2567 BE.
//

import SwiftUI

import SwiftUI

struct MultiplicationGameView: View {
    @State private var selectedTable = 2
    @State private var numberOfQuestions = 5
    @State private var currentQuestionIndex = 0
    @State private var questions: [Question] = []
    @State private var feedbackMessage = ""
    
    let maxTable = 12
    let questionOptions = [5, 10, 20]
    
    var body: some View {
        VStack {
            Text("Edutainment Demo")
                .font(.title)
            
            Stepper("Rounds \(selectedTable)", value: $selectedTable, in: 2...maxTable)
            
            Picker("Number of Questions", selection: $numberOfQuestions) {
                ForEach(questionOptions, id: \.self) { option in
                    Text("\(option)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            if questions.isEmpty {
                Button("Start Game", action: startGame)
            } else {
                QuestionView(question: questions[currentQuestionIndex], onSubmit: checkAnswer)
                Text(feedbackMessage)
                    .foregroundColor(feedbackMessage.contains("Correct") ? .green : .red)
            }
            
            Spacer()
        }
        .padding()
    }
    
    func startGame() {
        currentQuestionIndex = 0
        questions = generateQuestions()
        feedbackMessage = ""
    }
    
    func generateQuestions() -> [Question] {
        var newQuestions: [Question] = []
        for _ in 0..<numberOfQuestions {
            let num1 = Int.random(in: 1...selectedTable)
            let num2 = Int.random(in: 1...maxTable)
            newQuestions.append(Question(num1: num1, num2: num2))
        }
        return newQuestions
    }
    
    func checkAnswer(_ answer: Int) {
        let correctAnswer = questions[currentQuestionIndex].answer
        
        if answer == correctAnswer {
            feedbackMessage = "Correct!"
        } else {
            feedbackMessage = "Incorrect. The correct answer is \(correctAnswer)."
        }
        
        if currentQuestionIndex < numberOfQuestions - 1 {
            currentQuestionIndex += 1
        } else {
            feedbackMessage += " Game Over!"
            questions.removeAll()
        }
    }
}

struct QuestionView: View {
    let question: Question
    let onSubmit: (Int) -> Void
    
    @State private var selectedAnswer: Int?
    
    var body: some View {
        VStack {
            Text("\(question.num1) x \(question.num2) = ?")
                .font(.title)
                .padding(.bottom)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 4) {
                ForEach(1..<5) { index in
                    let answer = index * self.question.num2
                    Button(action: {
                        self.selectedAnswer = answer
                        self.onSubmit(answer)
                    }) {
                        Text("\(answer)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(self.selectedAnswer == answer ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(10)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
    }
}





struct Question {
    let num1: Int
    let num2: Int
    
    var answer: Int {
        return num1 * num2
    }
}



    #Preview {
        MultiplicationGameView()
    }
