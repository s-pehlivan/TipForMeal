//
//  CalculatorBrain.swift
//  TipForMeal
//
//  Created by Sora on 17.06.2022.
//

import Foundation

class CalculatorBrain {

    var calculation = Calculation()
    
    func getTipPercentage(tipPerc: String) {
        switch tipPerc {
        case "0%":
            calculation.tipPercentage = 0.0
            calculation.tipAmountText = tipPerc
        case "10%":
            calculation.tipPercentage = 0.1
            calculation.tipAmountText = tipPerc
        default:
            calculation.tipPercentage = 0.2
            calculation.tipAmountText = tipPerc
        }
    }
    
    func getSplitNumber(split: Double) {
        calculation.splitNumber = Int(split)
    }
    
    func printSplitNumber() -> String{
        return "\(calculation.splitNumber ?? 2)"
    }
    
    func getBillText(bill: String?) {
            calculation.billText = bill
    }
    
    
    func calcMoney() {
        if let bill = Double(calculation.billText ?? "0.0") {
            let tipAmount = bill * (calculation.tipPercentage ?? 0.0)
            let totalMoney = bill + tipAmount
            calculation.moneyPerPerson = round((totalMoney / Double(calculation.splitNumber ?? 0)) * 100) / 100
        }
    }
}
