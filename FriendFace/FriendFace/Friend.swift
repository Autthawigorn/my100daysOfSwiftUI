//
//  Friend.swift
//  FriendFace
//
//  Created by Autthawigorn Yortpiboot on 26/5/2567 BE.
//

import Foundation

struct Friend: Hashable, Identifiable, Codable {
    let id: UUID
    var name: String
}
