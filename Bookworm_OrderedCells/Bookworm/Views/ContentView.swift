//
//  ContentView.swift
//  Bookworm
//
//  Created by Autthawigorn Yortpiboot on 18/5/2567 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    //    @Query(sort: [
    //        SortDescriptor(\Book.title),
    //        SortDescriptor(\Book.author)
    //    ]) var books: [Book]
    
    @Query() var books: [Book]
    @Query() var bookOrders: [BookOrder] // the query brings back an array
    
    @State private var showingAddScreen = false
    
    // this gives the people in the order that you determine
    var orderedBooks: [Book] {
        // break out books into arrays of books who have the same
        // referenceID -- but, of course, there's only one for each referenceID
        let uuidLookup = Dictionary(grouping: books, by: { $0.referenceID })
        // bookOrders.first is, what should be, the only BookOrder of
        // interest, so use its uuidOrder and, for each element, find
        // the Book with that UUID
        return bookOrders.first?.uuidOrder.compactMap({ uuidLookup[$0]?.first }) ?? []
    }
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(orderedBooks) { book in
                    NavigationLink{
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack (alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onMove(perform: moveBooks)
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView(bookOrders: .constant(bookOrders))
            }
        }
        .onAppear { // establish the one and only BookOrder object if we need to
            if bookOrders.count == 0 {
                let firstBookOrder = BookOrder()
                modelContext.insert(firstBookOrder)
            }
        }
    }
    
    func moveBooks(indices: IndexSet, newOffset: Int) {
        // moving book around in this list is represented by
        // just moving their referenceIDs in the BookOrder
        bookOrders.first?.uuidOrder.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
