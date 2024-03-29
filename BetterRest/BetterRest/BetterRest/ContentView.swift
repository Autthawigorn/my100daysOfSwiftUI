//
//  ContentView.swift
//  BetterRest
//
//  Created by Autthawigorn Yortpiboot on 29/3/2567 BE.
//



import CoreML
import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = SleepCalculatorViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Form {
                    Section (header: Text("When do you want to wake up?")) {
                        DatePicker("Please enter date", selection: $viewModel.wakeUp, displayedComponents: .hourAndMinute)
                        //.labelsHidden()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    Section (header: Text("Desired amount of sleep")) {
                        
                        Stepper("\(viewModel.sleepAmount.formatted()) hours", value: $viewModel.sleepAmount, in: 4...12, step: 0.25)
                    }
                    
                    Section (header: Text("Daily coffee intake")) {
                        
                        Picker("^[\(viewModel.coffeeAmount) cup](inflect: true)", selection: $viewModel.coffeeAmount) {
                            ForEach(1...20, id: \.self) {
                                Text("^[\($0) cup](inflect: true)")
                            }
                        }
                        
                        //                    Stepper("\(viewModel.coffeeAmount) cup\(viewModel.coffeeAmount == 1 ? "" : "s")", value: $viewModel.coffeeAmount, in: 1...20)
                        
                    }

                }
                
                VStack {
                          Spacer()
                           VStack(spacing: 4) {
                               Text("Reccommend Bedtime")
                                   .foregroundColor(.white.opacity(0.6))
                               
                               Text(viewModel.calculateBedtime())
                                   .font(.largeTitle.bold())
                                   .foregroundColor(.white)
                           }
                           .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                           .padding()
                          .background(.ultraThinMaterial).opacity(0.9)
                           .background(
                               RoundedRectangle(cornerRadius: 0)
                                .fill(Color.black.opacity(0.5))
                                .ignoresSafeArea(.all)
                                  
                           )
                }
                //Button("Calculate", action: viewModel.calculateBedtime)
                
            }
            .navigationTitle("BetterRest")
            
            .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
                Button("OK") { }
            } message: {
                Text(viewModel.alertMessage)
            }
        }
    }
}

extension ContentView {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
}

#Preview {
    ContentView()
}
