//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Aryan Jaiswal on 09/10/25.
//

import SwiftUI

// MARK: - Main Content View
struct ContentView: View {
    
    // MARK: - State Properties
    // @State is a property wrapper that allows SwiftUI to manage the state of these variables
    // When these values change, SwiftUI automatically re-renders the view
    
    @State private var weight: String = "" // User's weight input as String (for TextField)
    @State private var height: String = "" // User's height input as String
    @State private var selectedUnit: Int = 0 // 0 for Metric, 1 for Imperial
    @State private var bmiResult: BMIResult? // Optional - nil until BMI is calculated
    @State private var showingResult: Bool = false // Controls whether to show result card
    
    // MARK: - Computed Properties
    // These properties are calculated on-the-fly and don't store values
        
    // Array of unit options for the Picker
    private let units = ["Metric (kg/cm)","Imperial (lbs/in)"]
    
    //Determines if the calculate button should be enabled
    private var isInputValid: Bool {
        // Check if both fields have valid numbers greater than 0
        guard let w = Double(weight), let h = Double(height),
              w > 0, h > 0 else {
            return false
        }
        return true
    }
    
    // MARK: - Body (UI Layout)
    var body: some View{
        // NavigationView provides navigation bar at the top
        NavigationView{
            //ScrollView allows content to scroll if it doesn't fit on screen
            ScrollView{
                // VStack arranges views vertically
                VStack(spacing: 25) {
                    
                    // MARK: - Header Section

                    VStack(spacing: 8){
                        
                        Image(systemName: "figure.walk")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                        Text("BMI Calculator")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Calculate your Body Mass Index")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    .padding(.top,20)
                    
                    // MARK: - Unit Selector
                    // Picker allows user to choose between different options
                    
                    Picker("Unit System", selection: $selectedUnit){
                        
                        // ForEach loops through the units array
                        ForEach(0..<units.count, id: \.self){
                            index in Text(units[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())// iOS-style segmented control
                    .padding(.horizontal)
                    
                    // MARK: - Input Fields
                    VStack(spacing: 20){
                        // Custom input field for weight
                        InputFieldView(
                            title: selectedUnit == 0 ? "Weight (kg)" : "Weight (lbs)",
                            text: $weight, // $ creates a binding - two-way connection
                            icon: "scalemass"
                        )
                        
                        // Custom input field for height
                        InputFieldView(
                            title: selectedUnit == 0 ? "Height (cm)" : "Height (in)",
                            text: $height,
                            icon: "ruler"
                        )
                    }
                    .padding(.horizontal)
                    
                    //MARK: - Calculate Button
                    Button(action: calculateBMI){ // action is called when button is tapped
                        HStack{
                            Image(systemName: "arrow.right.circle.fill")
                            Text("Calculate BMI")
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity) // Makes button full width
                        .padding()
                        .background(isInputValid ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .disabled(!isInputValid)// Disables button if input is invalid
                    .padding(.horizontal)
                    
                    // MARK: - Result Display
                    // Only shows if bmiResult has a value and showingResult is true
                    
                    if let result = bmiResult, showingResult {
                        ResultCardView(result:result)
                            .padding(.horizontal)
                            .transition(.scale.combined(with: .opacity)) // Animation effect
                    }
                    
                    Spacer() // Pushes content to the top
                    
                }
            }
            .navigationBarTitleDisplayMode(.inline)// Makes nav bar compact
        }
    }
    
    // MARK: - BMI Calculation Function
        // This function performs the BMI calculation and updates the result
        private func calculateBMI() {
            // Guard statement safely unwraps optionals and exits if conversion fails
            guard let weightValue = Double(weight),
                  let heightValue = Double(height) else {
                return
            }
            
            var bmi: Double
            
            // Calculate BMI based on selected unit system
            if selectedUnit == 0 {
                // Metric: BMI = weight(kg) / (height(m))²
                let heightInMeters = heightValue / 100 // Convert cm to meters
                bmi = weightValue / (heightInMeters * heightInMeters)
            } else {
                // Imperial: BMI = (weight(lb) / (height(in))²) × 703
                bmi = (weightValue / (heightValue * heightValue)) * 703
            }
            
            // Interpret BMI value and assign category, color, and advice
            let interpretation = interpretBMI(bmi)
            
            // Create BMIResult object with calculated values
            bmiResult = BMIResult(
                value: bmi,
                category: interpretation.category,
                color: interpretation.color,
                advice: interpretation.advice
            )
            
            // withAnimation creates a smooth transition when showing the result
            withAnimation(.spring()) {
                showingResult = true
            }
        }
    
    // MARK: - BMI Interpretation Function
        // Returns a tuple (group of related values) with category info
        private func interpretBMI(_ bmi: Double) -> (category: String, color: Color, advice: String) {
            // Switch statement checks which range the BMI falls into
            switch bmi {
            case ..<18.5:
                return ("Underweight", .blue, "You may need to gain weight. Consult a healthcare provider.")
            case 18.5..<25:
                return ("Normal", .green, "Great! You're in a healthy weight range.")
            case 25..<30:
                return ("Overweight", .orange, "Consider a balanced diet and regular exercise.")
            case 30...:
                return ("Obese", .red, "It's important to consult with a healthcare professional.")
            default:
                return ("Unknown", .gray, "Unable to determine BMI category.")
            }
        }
    }
        
// MARK: - Result Card Component
// Displays the BMI calculation result in a card format
struct ResultCardView: View {
    let result: BMIResult
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Your BMI")
                .font(.headline)
                .foregroundColor(.gray)
            
            // Display BMI value with large font
            Text(String(format: "%.1f", result.value)) // format: "%.1f" rounds to 1 decimal place
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(result.color)
            
            // Category badge
            Text(result.category)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(result.color.opacity(0.2)) // Semi-transparent background
                .foregroundColor(result.color)
                .cornerRadius(20)
            
            // Divider line
            Divider()
                .padding(.vertical, 5)
            
            // Advice text
            Text(result.advice)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
        }
        .padding(25)
        .background(Color(.systemBackground)) // Adapts to light/dark mode
        .cornerRadius(20)
        .shadow(color: result.color.opacity(0.3), radius: 10, x: 0, y: 5) // Drop shadow
    }
}

// MARK: - Preview Provider
// Allows you to see the UI in Xcode's preview canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - BMI Data Model
// This struct holds the BMI calculation result and interpretation
struct BMIResult {
    let value: Double // The calculated BMI value
    let category: String // Category like "Normal", "Overweight", etc.
    let color: Color // Color to represent the category visually
    let advice: String // Health advice based on BMI
}
