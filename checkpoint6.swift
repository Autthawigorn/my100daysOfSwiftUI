//
//  checkpoint6.swift
//  
//
//  Created by Autthawigorn Yortpiboot on 13/3/2567 BE.
//

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = 1
    }
    
    mutating func changeGear(to gear: Int) {
        if (1...10).contains(gear) {
            let previousGear = self.currentGear
            self.currentGear = gear
            print("Changed from \(previousGear) to \(gear)")
        } else {
            print("Invalid gear")
        }
    }
    
    mutating func changeGearUp() {
        if currentGear < 10 {
            changeGear(to: currentGear + 1)
        } else {
            print("Already in top gear")
        }
    }
    
    mutating func changeGearDown() {
        if currentGear > 1 {
            changeGear(to: currentGear - 1)
        } else {
            print("Already in first gear")
        }
    }
}

//run test
var car = Car(model: "CannedCatCar", numberOfSeats: 11)
car.changeGearDown()
car.changeGearUp()
car.changeGearUp()
car.changeGearDown()
car.changeGearDown()
car.changeGear(to: 10)
car.changeGearUp()
car.changeGear(to: 99)

