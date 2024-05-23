//
//  Student.swift
//  TestSwiftData
//
//  Created by Autthawigorn Yortpiboot on 18/5/2567 BE.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

