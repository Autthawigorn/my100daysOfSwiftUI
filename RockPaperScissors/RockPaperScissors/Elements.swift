//
//  Elements.swift
//  RockPaperScissors
//
//  Created by Autthawigorn Yortpiboot on 26/3/2567 BE.
//

import SwiftUI

struct Condition {
    
    let conditions = ["win", "lose"].shuffled()
    let randomCondition: String
    
    init() {
        randomCondition = conditions.first ?? "No questions available."
    }
  
    
    func generateCondition() -> some View  {
       
        
        let color = (randomCondition == "win") ? Color.green : (randomCondition == "lose") ? Color.red : Color.white
        
        return Group {
            Text("Pick one to ")
                .foregroundColor(.white)
            + Text(randomCondition)
                .foregroundColor(color)
            + Text(" this!")
                .foregroundColor(.white)
        }
        .font(.title)
        .bold()
    }
}

struct Choices {
    
    let choicesImage = ["rock", "paper", "scissors"].shuffled()
    
  //  var didSelect: ((String) -> Void)?
    
    func choicesButton(didSelect: @escaping (String) -> Void) -> some View  {
        HStack {
            ForEach(choicesImage, id: \.self) { imageName in
                Button {
                
                    didSelect(imageName) // Call the action closure when a choice is made
                    print("Button tapped with image: \(imageName)")
                } label: {
                    Image(imageName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

