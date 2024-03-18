//
//  checkpoint9.swift
//  
//
//  Created by Autthawigorn Yortpiboot on 18/3/2567 BE.
//

func randomNumber(number:[Int]? = nil) -> Int  {
    
    return number?.randomElement() ?? Int.random(in: 1...100)
    
}

print(randomNumber())
