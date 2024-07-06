//
//  Distance.swift
//  Units onTheGo
//
//  Created by Parth Antala on 2024-07-05.
//

import SwiftUI
enum Distances: String, CaseIterable, Identifiable {
    case Kilometers = "KM"
    case Feet = "Feet"
    case Yards = "Yards"
    case Miles = "Miles"
    case meters = "meters"
    var id: Self { self }
}

// Conversion factors
let metersToKilometers = 0.001
let metersToFeet = 3.28084
let metersToYards = 1.09361
let metersToMiles = 0.000621371

struct Distance: View {
    @State private var selectedInputDistance: Distances = Distances.Feet
    @State private var selectedOutputDistance: Distances = Distances.Feet
    
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
                                .foregroundColor(.blue.opacity(0.7))
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
                                .foregroundColor(.blue.opacity(0.7))
                        }
                    }
                        
                }
                
                Picker("temprature", selection: $selectedInputDistance) {
                    ForEach(Distances.allCases, id: \.self) { temp in
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
                    .white, .white, .blue,
                    .white, .white, .cyan,
                    .blue, .blue, .cyan
                ])
                .ignoresSafeArea()
            )
            
            
            
            
            VStack {
                
                    
                    
                Picker("temprature", selection: $selectedOutputDistance) {
                        ForEach(Distances.allCases, id: \.self) { temp in
                            Text(temp.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                var out = convertLength(value: input, fromUnit: selectedInputDistance.rawValue, toUnit: selectedOutputDistance.rawValue)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.blue)
                        .opacity(0.4)
                        .shadow(radius: 10)
                        .frame(width: 350)
                        .padding()
                    
                    let formattedValue = String(format: "%.2f", out)
                    
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
                    .blue, .blue, .cyan,
                    .white, .white, .green,
                    .white, .white, .white
                ])
                .ignoresSafeArea()
            )
        }
    }
}

func convertLength(value: Double, fromUnit: String, toUnit: String) -> Double {
    var valueInMeters: Double = value
    
    // Convert input to meters
    switch fromUnit.lowercased() {
    case "KM":
        valueInMeters = value / metersToKilometers
    case "feet":
        valueInMeters = value / metersToFeet
    case "yards":
        valueInMeters = value / metersToYards
    case "miles":
        valueInMeters = value / metersToMiles
    case "meters":
        break
    default:
        print("Invalid from unit")
        return 0.0
    }
    
    // Convert meters to target unit
    switch toUnit.lowercased() {
    case "KM":
        return valueInMeters * metersToKilometers
    case "feet":
        return valueInMeters * metersToFeet
    case "yards":
        return valueInMeters * metersToYards
    case "miles":
        return valueInMeters * metersToMiles
    case "meters":
        return valueInMeters
    default:
        print("Invalid to unit")
        return 0.0
    }
}

#Preview {
    Distance()
}
