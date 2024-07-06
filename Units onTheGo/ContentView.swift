//
//  ContentView.swift
//  Units onTheGo
//
//  Created by Parth Antala on 2024-07-05.
//

import SwiftUI

enum Temp: String, CaseIterable, Identifiable {
    case Celsius = "Celsius"
    case Fahrenheit = "Fahrenheit"
    case Kelvin = "Kelvin"
    
    var id: Self { self }
}

struct ContentView: View {
    
    @State private var isFavorite = false
    
    
    var body: some View {
        TabView {
         TempView()
                .tabItem {
                    Label("Temp", systemImage: "thermometer.low" )
                }
            
            Distance()
                .tabItem{
                    Label("Length", systemImage: "ruler.fill")
                }
            
            Time()
                .tabItem {
                    Label("Time", systemImage: "clock.circle")
                }
            
            Volume()
                .tabItem {
                    Label("Volume", systemImage: "drop.degreesign.fill")
                        
                }
        }
        .background(.green)
                
    }
}


struct TempView: View {
    @State private var selectedInputTemp: Temp = Temp.Celsius
    @State private var selectedOutputTemp: Temp = Temp.Celsius
    
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
                                .foregroundColor(.purple.opacity(0.7))
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
                                .foregroundColor(.purple.opacity(0.7))
                        }
                    }
                        
                }
                
                Picker("temprature", selection: $selectedInputTemp) {
                    ForEach(Temp.allCases, id: \.self) { temp in
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
                    .white, .white, .purple,
                    .indigo, .indigo, .pink
                ])
                .ignoresSafeArea()
            )
            
            
            
            
            VStack {
                
                    
                    
                    Picker("temprature", selection: $selectedOutputTemp) {
                        ForEach(Temp.allCases, id: \.self) { temp in
                            Text(temp.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    var out = convert(input: input, inUnit: selectedInputTemp, outUnit: selectedOutputTemp)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.purple)
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
                    .indigo, .indigo, .pink,
                    .white, .white, .purple,
                    .white, .white, .white
                ])
                .ignoresSafeArea()
            )
        }
        
    }
}

struct OutputView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}


func convert(input: Double, inUnit: Temp, outUnit: Temp) -> Double {
    switch (inUnit, outUnit) {
        case (.Celsius, .Fahrenheit):
            return (input * 9/5) + 32
        case (.Celsius, .Kelvin):
            return input + 273.15
        case (.Fahrenheit, .Celsius):
            return (input - 32) * 5/9
        case (.Fahrenheit, .Kelvin):
            return (input - 32) * 5/9 + 273.15
        case (.Kelvin, .Celsius):
            return input - 273.15
        case (.Kelvin, .Fahrenheit):
            return (input - 273.15) * 9/5 + 32
        case (_, _):
            return input
        }
}



#Preview {
    ContentView()
}
