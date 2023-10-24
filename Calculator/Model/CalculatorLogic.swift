//
//  CalculatorLogic.swift
//  Calculator
//


import Foundation

struct CalculatorLogic {
    
    // MARK: - Properties
    private var number: Double?
    var intermediateCalculation: (firstNumber: Double, operation: String)?
    
    
    // MARK: - Prime functions
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculation(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumbersCalculation(n2: n)
            default:
                intermediateCalculation = (firstNumber: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumbersCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.firstNumber,
           let operation = intermediateCalculation?.operation {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷" where n2 != 0:
                return n1 / n2
            default:
                return nil
            }
        }
        return nil
    }
}
