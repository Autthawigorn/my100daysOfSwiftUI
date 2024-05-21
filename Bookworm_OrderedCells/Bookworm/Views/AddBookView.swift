//
//  AddBookView.swift
//  Bookworm
//
//  Created by Autthawigorn Yortpiboot on 18/5/2567 BE.
//

import SwiftUI
//import SwiftData // test import to make preview

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dissmiss
    
    @Binding var bookOrders: [BookOrder]
    
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
                        
                        // add to the model context, but also add its referenceID to the BookOrder
                        bookOrders.first?.uuidOrder.append(newBook.referenceID)
                        
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


//struct AddBookView_Previews: PreviewProvider {
//    struct PreviewWrapper: View {
//        @State private var bookOrders = [BookOrder()]
//        
//        var body: some View {
//            AddBookView(bookOrders: $bookOrders)
//                .modelContainer(for: [Book.self, BookOrder.self], inMemory: true)
//        }
//    }
//    
//    static var previews: some View {
//        PreviewWrapper()
//    }
//}
