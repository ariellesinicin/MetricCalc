//
//  MetricCalculator.swift
//  MetricCalc
//
//  Created by Arielle Sinicin on 9/12/21.
//

import Foundation

// Calculator Modes enumerator
// Global enumeration type declaration
enum CalculatorModes: String {
    case temperature = "Temperature"
    case length = "Length"
    // new
    case mass = "Mass"
    case volume = "Volume"
}

// Model
// struct similar to a class
struct MetricCalculator {
    // declare properties (instance variables)
    // Calculator's current mode
    var currentMode: CalculatorModes
    
    //  conversion constants
    let temperatureConversionMultiplier = 9.0/5.0
    let temperatureConversionOffset = 32.0
    //new
    let lengthConversionMultiplier = 1.60934
    let massConversionMultiplier = 0.45359237
    let volumeConversionMultiplier = 3.78541
    
    // unit conversion method
    func computeMetricMeasurement (inputData: Double) -> Double {
        switch (currentMode) {
        case .temperature:
            return (inputData - temperatureConversionOffset) / temperatureConversionMultiplier
        case .length:
            return (inputData * lengthConversionMultiplier)
        // new
        case .mass:
            return (inputData * massConversionMultiplier)
        case .volume:
            return (inputData * volumeConversionMultiplier)
        }
        
    }
    
}
