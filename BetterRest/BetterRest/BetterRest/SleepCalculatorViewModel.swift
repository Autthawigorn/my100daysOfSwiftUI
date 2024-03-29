//
//  ViewModel.swift
//  BetterRest
//
//  Created by Autthawigorn Yortpiboot on 29/3/2567 BE.
//


import Foundation
import CoreML

class SleepCalculatorViewModel: ObservableObject {
    @Published var wakeUp = ContentView.defaultWakeTime
    @Published var sleepAmount = 8.0
    @Published var coffeeAmount = 1
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var showingAlert = false
    @Published var calculationResult: SleepCalculationResult? // Added calculationResult
    
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
//            alertTitle = "Your ideal bedtime is…"
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
            // Store the calculation result
            calculationResult = SleepCalculationResult(idealBedtime: sleepTime)
            
        } catch {
            return "Error"
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}
