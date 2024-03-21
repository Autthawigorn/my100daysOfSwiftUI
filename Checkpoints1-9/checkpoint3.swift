//
//  checkpoint3.swift
//  
//
//  Created by Autthawigorn Yortpiboot on 10/3/2567 BE.
//

for number in 1...100 {
    let fiz:Bool = number.isMultiple(of: 3)
    let buz:Bool = number.isMultiple(of: 5)
    switch (fiz, buz) {
    case (true, true):
        print("FizBuz")
    case (true, false):
        print("Fiz")
    case (false, true):
        print("Buz")
    default:
        print(number)
    }
}
