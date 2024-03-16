//
//  checkpoint8.swift
//  
//
//  Created by Autthawigorn Yortpiboot on 16/3/2567 BE.
//

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var agentName: String { get }
    func getSummary()
}

extension Building {
    
    func getSummary() {
        print("""
Summary of \(Self.self)
Rooms: \(self.rooms)
Cost: $\(self.cost)
Agent: \(self.agentName)

""")
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
}

let myHouse = House(rooms: 5, cost: 100_000, agentName: "Cat Estate")
myHouse.getSummary()

let myOffice = Office(rooms: 10, cost: 500_000, agentName: "Dog Estate")
myOffice.getSummary()
