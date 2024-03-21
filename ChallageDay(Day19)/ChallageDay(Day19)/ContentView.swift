//
//  ContentView.swift
//  ChallageDay(Day19)
//
//  Created by Autthawigorn Yortpiboot on 21/3/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var lengthCentimeters = ""
    @State private var selectedUnitIndex = "meters"
    @FocusState private var insertLengthIsFocus: Bool
    
    let lengthUnits = ["meters", "kilometers", "feet", "yard", "miles"]
    
    var convertedLength: Double {
        let length = Double(lengthCentimeters) ?? 0.0
        let conversionFactor = getConversionFactor()
        return length * conversionFactor
    }
    
    func getConversionFactor() -> Double {
        switch selectedUnitIndex {
        case "meters":
            return 0.01
        case "kilometers":
            return 0.00001
        case "feet":
            return 0.0328084
        case "yard":
            return 0.0109361
        case "miles":
            return 0.0000062137
        default:
            return 1.0
        }
    }

    
    var body: some View {
        
        NavigationView {
            
            Form {
                HStack {
                    TextField("Inset Length", text: $lengthCentimeters)
                        .keyboardType(.decimalPad)
                        .focused($insertLengthIsFocus)
                    Text("centimeter(s)")
                        .foregroundColor(.gray)
                }
                
                //---- Try Basic Simple Swift Code Style ------
                //                        Picker("Select Unit to Convert", selection: $selectedUnitIndex) {
                //                            ForEach(0..<lengthUnits.count) { index in
                //                                Text("\(self.lengthUnits[index])")
                //                            }
                //                        }
                
                //---- Use Paul Hudson Code Style ------
                Picker("Select Unit to Convert", selection: $selectedUnitIndex) {
                    ForEach(lengthUnits, id: \.self) { index in
                        Text("\(index)")
                    }
                }
                
                Section("Converted Result"){
                    Text("\(String(format: "%.2f", convertedLength))")
                }
                
            }
            .navigationTitle(/*@START_MENU_TOKEN@*/"Title"/*@END_MENU_TOKEN@*/)
            .toolbar {
                if insertLengthIsFocus == true {
                    Button("Done") {
                        insertLengthIsFocus = false
                    }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
