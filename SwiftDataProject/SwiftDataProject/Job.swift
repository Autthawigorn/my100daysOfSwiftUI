//
//  Job.swift
//  SwiftDataProject
//
//  Created by Autthawigorn Yortpiboot on 25/5/2567 BE.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var priority: Int
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
