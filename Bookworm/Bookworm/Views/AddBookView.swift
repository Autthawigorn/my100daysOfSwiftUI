//
//  AddBookView.swift
//  Bookworm
//
//  Created by Autthawigorn Yortpiboot on 18/5/2567 BE.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dissmiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Whrite a review") {
                    TextEditor(text: $review)
                    
                   RatingView(rating: $rating)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Section {
                    Button("Save"){
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dissmiss()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .toolbar {
                Button("Cancel") {
                    
                }
            }
            .navigationTitle("Add Book")
        }
    }
}


#Preview {
    AddBookView()
}
