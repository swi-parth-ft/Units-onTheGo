//
//  Volume.swift
//  Units onTheGo
//
//  Created by Parth Antala on 2024-07-05.
//

import SwiftUI
enum Vols: String, CaseIterable, Identifiable {
    case milliliters = "milliliters"
    case liters = "liters"
    case cups = "cups"
    case pints = "pints"
    case gallons = "gallons"
    var id: Self { self }
}

// Conversion factors
let millilitersToLiters = 0.001
let millilitersToCups = 0.00422675
let millilitersToPints = 0.00211338
let millilitersToGallons = 0.000264172

struct Volume: View {
    @State private var selectedInputVol: Vols = Vols.cups
    @State private var selectedOutputVol: Vols = Vols.cups
    
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
                                .foregroundColor(.orange.opacity(0.7))
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
                                .foregroundColor(.orange.opacity(0.7))
                        }
                    }
                        
                }
                
                Picker("temprature", selection: $selectedInputVol) {
                    ForEach(Vols.allCases, id: \.self) { temp in
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
                    .white, .white, .yellow,
                    .orange, .orange, .red
                ])
                .ignoresSafeArea()
            )
            
            
            
            
            VStack {
                
                    
                    
                Picker("temprature", selection: $selectedOutputVol) {
                    ForEach(Vols.allCases, id: \.self) { temp in
                            Text(temp.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                var out = convertVolume(value: input, fromUnit: selectedInputVol.rawValue, toUnit: selectedOutputVol.rawValue)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.orange)
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
                    .orange, .orange, .red,
                    .white, .white, .white,
                    .yellow, .white, .white
                ])
                .ignoresSafeArea()
            )
        }
    }
}

func convertVolume(value: Double, fromUnit: String, toUnit: String) -> Double {
    var valueInMilliliters: Double = value
    
    // Convert input to milliliters
    switch fromUnit.lowercased() {
    case "liters":
        valueInMilliliters = value / millilitersToLiters
    case "cups":
        valueInMilliliters = value / millilitersToCups
    case "pints":
        valueInMilliliters = value / millilitersToPints
    case "gallons":
        valueInMilliliters = value / millilitersToGallons
    case "milliliters":
        break
    default:
        print("Invalid from unit")
        return 0.0
    }
    
    // Convert milliliters to target unit
    switch toUnit.lowercased() {
    case "liters":
        return valueInMilliliters * millilitersToLiters
    case "cups":
        return valueInMilliliters * millilitersToCups
    case "pints":
        return valueInMilliliters * millilitersToPints
    case "gallons":
        return valueInMilliliters * millilitersToGallons
    case "milliliters":
        return valueInMilliliters
    default:
        print("Invalid to unit")
        return 0.0
    }
}

#Preview {
    Volume()
}
