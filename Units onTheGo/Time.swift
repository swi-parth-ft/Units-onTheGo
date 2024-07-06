//
//  Time.swift
//  Units onTheGo
//
//  Created by Parth Antala on 2024-07-05.
//

import SwiftUI
enum TimeUnits: String, CaseIterable, Identifiable {
    case seconds = "seconds"
    case minutes = "minutes"
    case hours = "hours"
    case days = "days"
    var id: Self { self }
}

// Conversion factors
let secondsToMinutes = 1.0 / 60.0
let secondsToHours = 1.0 / 3600.0
let secondsToDays = 1.0 / 86400.0

struct Time: View {
    @State private var selectedInputTime: TimeUnits = TimeUnits.days
    @State private var selectedOutputTime: TimeUnits = TimeUnits.days
    
    @State private var input: Double = 0
    @State private var output: Double = 0
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .opacity(0.4)
                        .shadow(radius: 10)
                        .frame(width: 350)
                        .padding()
                    HStack {
                        Button {
                            input -= 1
                        } label: {
                            Image(systemName: "minus.circle")
                                .font(.system(size: 42, weight: .heavy))
                                .foregroundColor(.green.opacity(0.7))
                        }
                        TextField("Value", value: $input, format: .number)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 70))
                            .keyboardType(.decimalPad)
                            .tint(.green)
                            .padding()
                            .frame(width: 150, height: 150)
                        Button {
                            input += 1
                        } label: {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 42, weight: .heavy))
                                .foregroundColor(.green.opacity(0.7))
                        }
                    }
                        
                }
                
                Picker("temprature", selection: $selectedInputTime) {
                    ForEach(TimeUnits.allCases, id: \.self) { temp in
                        Text(temp.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding()
            .background(
                MeshGradient(width: 3, height: 3, points: [
                    [0, 0], [0.5, 0], [1, 0],
                    [0, 0.5], [0.5, 0.5], [1, 0.5],
                    [0, 1], [0.5, 1], [1, 1]
                ], colors: [
                    .white, .white, .white,
                    .white, .white, .mint,
                    .teal, .teal, .green
                ])
                .ignoresSafeArea()
            )
            
            
            
            
            VStack {
                
                    
                    
                Picker("temprature", selection: $selectedOutputTime) {
                    ForEach(TimeUnits.allCases, id: \.self) { temp in
                            Text(temp.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                var out = convertTime(value: input, fromUnit: selectedInputTime.rawValue, toUnit: selectedOutputTime.rawValue)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.cyan)
                        .opacity(0.4)
                        .shadow(radius: 10)
                        .frame(width: 350)
                        .padding()
                    
                    let formattedValue = String(format: "%.0f", out)
                    
                    Text("\(formattedValue)")
                        .font(.system(size: 70))
                        .animation(.snappy)
                }
            }
            .padding()
            .background(
                MeshGradient(width: 3, height: 3, points: [
                    [0, 0], [0.5, 0], [1, 0],
                    [0, 0.5], [0.5, 0.5], [1, 0.5],
                    [0, 1], [0.5, 1], [1, 1]
                ], colors: [
                    .teal, .teal, .green,
                    .white, .white, .mint,
                    .white, .white, .white
                ])
                .ignoresSafeArea()
            )
        }
    }
}

func convertTime(value: Double, fromUnit: String, toUnit: String) -> Double {
    var valueInSeconds: Double = value
    
    // Convert input to seconds
    switch fromUnit.lowercased() {
    case "minutes":
        valueInSeconds = value / secondsToMinutes
    case "hours":
        valueInSeconds = value / secondsToHours
    case "days":
        valueInSeconds = value / secondsToDays
    case "seconds":
        break
    default:
        print("Invalid from unit")
        return 0.0
    }
    
    // Convert seconds to target unit
    switch toUnit.lowercased() {
    case "minutes":
        return valueInSeconds * secondsToMinutes
    case "hours":
        return valueInSeconds * secondsToHours
    case "days":
        return valueInSeconds * secondsToDays
    case "seconds":
        return valueInSeconds
    default:
        print("Invalid to unit")
        return 0.0
    }
}

#Preview {
    Time()
}
