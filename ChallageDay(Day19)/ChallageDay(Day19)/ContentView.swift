//
//  ContentView.swift
//  ChallageDay(Day19)
//
//  Created by Autthawigorn Yortpiboot on 21/3/2567 BE.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var inputValue: Double = 0
    @State private var inputUnit: Dimension = UnitDuration.hours
    @State private var outputUnit: Dimension = UnitDuration.seconds
    @State private var selectedUnits = 2
    @FocusState private var inputIsFocused: Bool
    
    // Conversion types available
    let conversionTypes = ["Temperature", "Length", "Time", "Volume"]
    
    // Units for each conversion type
    var units: [[Dimension]] {
        let tempUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
        let lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
        let timeUnits: [UnitDuration] = [.seconds, .minutes, .hours]
        let volumeUnits: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
        
        return [
            tempUnits,
            lengthUnits,
            timeUnits,
            volumeUnits,
        ]
    }
    
    // Formatter for displaying measurements
    let formatter: MeasurementFormatter
    
    // MARK: - Initialization
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .short
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Form {
                // Input section
                Section(header: Text("Amount to Convert")) {
                    TextField("Input", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }
                
                // Unit selection section
                Section(header: Text("\(formatter.string(from: inputUnit)) to \(formatter.string(from: outputUnit))")) {
                    unitPicker(title: "Convert from Unit", selection: $inputUnit)
                    unitPicker(title: "Convert to Unit", selection: $outputUnit)
                }
                
                // Result section
                Section(header: Text("Result")) {
                    Text(conversionResult)
                }
                
                // Conversion type picker
                Picker("Conversion", selection: $selectedUnits) {
                    ForEach(conversionTypes.indices, id: \.self) {
                        Text(conversionTypes[$0])
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 170)
            }
            .navigationTitle("Converter")
            .toolbar {
                // Done button for dismissing keyboard
                ToolbarItem(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
            .onChange(of: selectedUnits) { newUnits in
                // Update selected units when conversion type changes
                inputUnit = units[newUnits][0]
                outputUnit = units[newUnits][1]
            }
        }
    }
    
    // MARK: - Helper Methods
    private func unitPicker(title: String, selection: Binding<Dimension>) -> some View {
        Picker(title, selection: selection) {
            ForEach(units[selectedUnits], id: \.self) {
                Text(formatter.string(from: $0).capitalized)
            }
        }
        .pickerStyle(.segmented)
    }
    
    private var conversionResult: String {
        // Calculate conversion result
        let outputMeasurement = Measurement(value: inputValue, unit: inputUnit).converted(to: outputUnit)
        return formatter.string(from: outputMeasurement)
    }
}

// MARK: - Preview


#Preview {
    ContentView()
}
