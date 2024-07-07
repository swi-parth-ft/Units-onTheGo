# Units onTheGo

Created by Parth Antala on 2024-07-05

## Overview
Units onTheGo is a versatile iOS app built using SwiftUI, designed to quickly convert units across different categories including temperature, length, time, and volume. The app provides segmented pickers for both input and output units, ensuring intuitive and efficient unit conversion for users.

## Features
- Convert units of temperature (Celsius, Fahrenheit, Kelvin).
- Convert units of length (e.g., kilometers, feet, yards, miles, meters).
- Convert units of time (e.g., seconds, minutes, hours).
- Convert units of volume (e.g., liters, gallons, cubic meters).
- Interactive segmented pickers for selecting input and output units.
- Real-time conversion updates displayed instantly.

## Screenshots
Include some screenshots here to give a visual overview of the app.

## Getting Started

### Prerequisites
- Xcode 12 or later
- iOS 14 or later

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/units-onTheGo.git
    ```
2. Open the project in Xcode:
    ```bash
    cd units-onTheGo && open UnitsOnTheGo.xcodeproj
    ```
3. Build and run the project on your preferred simulator or device.

## Usage
1. Launch the app to start converting units on the go.
2. Select the category (Temp, Length, Time, Volume) from the tab bar.
3. Choose the input unit and enter a value.
4. Select the desired output unit to instantly see the converted result.

## Code Overview

### Main Components
- `ContentView.swift`: The main view of the app, housing the TabView for navigating between different unit conversion categories.
- `TempView`, `Distance`, `Time`, `Volume`: Views for each unit conversion category, containing segmented pickers and conversion logic specific to their respective categories.
- `Temp`, `Distances`: Enums representing units for temperature and distance conversions respectively.
- Functions (`convert`, `convertLength`): Helper functions to perform unit conversions based on selected input and output units.

### Key Functions
- `convert(input: Double, inUnit: Temp, outUnit: Temp)`: Handles the conversion logic for different unit categories (temperature).
- `convertLength(value: Double, fromUnit: String, toUnit: String)`: Handles the conversion logic for distance units using predefined conversion factors.

