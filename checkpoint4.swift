//
//  checkpoint4.swift
//  
//
//  Created by Autthawigorn Yortpiboot on 10/3/2567 BE.
//

import Foundation

enum SqrtError: Error {
  case outOfBounds, noRoot
}

func squareRoot(of number: Int) throws -> Int {
  if number < 1 || number > 10_000 {
    throw SqrtError.outOfBounds
  }

  for i in 1...100 {
    if number == i * i {
      print("The sqrt of \(number) is \(i)")
    }
  }

  throw SqrtError.noRoot
}

for numberTest in 0...12 {
  do {
      let ans = try squareRoot(of:numberTest)
    print(ans)
  } catch {
    print("\(numberTest) is \(error)")
  }
}
