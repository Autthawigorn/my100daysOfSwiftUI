//
//  ContentView.swift
//  WeSplit
//
//  Created by Autthawigorn Yortpiboot on 19/3/2567 BE.
//

import SwiftUI


struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
 //   let tipPercentages = [10, 15, 20, 25, 0]
    
    //--- split computed property to use the grandTotal---
    var tipValue: Double {
        return checkAmount / 100 * Double(tipPercentage)
    }
    
    var grandTotal: Double {
        return checkAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return grandTotal / peopleCount
    }
    
    
    //    var totalPerPerson: Double {
    //        let peopleCount = Double(numberOfPeople + 2)
    //        let tipSelection = Double(tipPercentage)
    //
    //        let tipValue = checkAmount / 100 * tipSelection
    //        let grandTotal = checkAmount + tipValue
    //        let amountPerPerson = grandTotal / peopleCount
    //        return amountPerPerson
    //    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                //----Challgange 3-----
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101)/*(tipPercentages, id: \.self) */{ tip in
                            Text("\(tip)%")
                        }
                    }
                    //.pickerStyle(SegmentedPickerStyle())
                  .pickerStyle(.navigationLink)
                }
                //----Challgange 2-----
                Section ("Grand Total (Included Tip)"){
                    Text(grandTotal , format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                //----Challgange 1-----
                Section ("Amount Per Person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
            } .navigationTitle("WeSplit")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
