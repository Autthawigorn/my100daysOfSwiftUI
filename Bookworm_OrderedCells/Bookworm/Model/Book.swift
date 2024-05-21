//
//  Book.swift
//  Bookworm
//
//  Created by Autthawigorn Yortpiboot on 18/5/2567 BE.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    let referenceID = UUID() // something unique to identify this book
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
    
}

@Model
class BookOrder {
    var uuidOrder: [UUID] // an array to show the order of book by UUID

    init() {
        uuidOrder = []
    }
}
