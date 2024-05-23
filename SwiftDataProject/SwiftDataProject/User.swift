//
//  User.swift
//  SwiftDataProject
//
//  Created by Autthawigorn Yortpiboot on 22/5/2567 BE.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
