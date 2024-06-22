//
//  Card.swift
//  Flashzilla
//
//  Created by Autthawigorn Yortpiboot on 20/6/2567 BE.
//

import Foundation

struct Card: Codable, Equatable, Identifiable, Hashable {
    var id = UUID()
    var prompt: String
    var answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
