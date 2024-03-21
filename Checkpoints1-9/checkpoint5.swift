//
//  checkpoint5.swift
//  
//
//  Created by Autthawigorn Yortpiboot on 10/3/2567 BE.
//

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


let sortedResult = luckyNumbers.sorted {$0 < $1}
let filteredNumbers = sortedResult.filter { !$0.isMultiple(of: 2) }
let mappedStrings:[()] = filteredNumbers.map {print("\($0) is a lucky number")}

