//
//  ContentView.swift
//  TestSwiftData
//
//  Created by Autthawigorn Yortpiboot on 18/5/2567 BE.
//

//
//  ContentView.swift
//  TestSwiftData
//
//  Created by Autthawigorn Yortpiboot on 18/5/2567 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    @State private var localStudents: [Student] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(localStudents) { student in
                    Text(student.name)
                        .swipeActions {
                            Button(role: .destructive) { // Custom Delete Button
                                modelContext.delete(student)
                                updateLocalStudents()
                            } label: { Label("Delete", systemImage: "trash") }
                        }
                }
                .onMove(perform: move)
                .onDelete { offsets in
                    offsets.forEach { index in
                        modelContext.delete(students[index])
                    }
                }
            }
            .onAppear(perform: updateLocalStudents)
            .navigationTitle("Classroom")
            .toolbar {
                EditButton()
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement() ?? "Hum"
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    modelContext.insert(student)
                    updateLocalStudents()
                }
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        localStudents.move(fromOffsets: source, toOffset: destination)
        // Sync this order with your data model if needed
        // In this example, localStudents is updated, but additional work
        // may be required to persist this order change in the data source
    }
    
    func updateLocalStudents() {
        localStudents = students
    }
}

#Preview {
    ContentView()
}
