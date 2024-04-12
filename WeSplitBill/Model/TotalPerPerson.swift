//
//  TotalPerPerson.swift
//  WeSplitBill
//
//  Created by Suraj Gupta on 12/04/24.
//

import Foundation


import Foundation

enum TipCalculateError: Error {
    case invalidInput
}

class TotalPerPerson {

    func calculateTip(amount: Double, tipPercent: Int) throws -> Double {
        if amount < 0 || tipPercent < 0 {
            throw TipCalculateError.invalidInput
        }
        return (amount*Double(tipPercent))/100
    }
    
    
    func calculateFinalAmount(amount: Double, tipPercent: Int, totalPerson: Int) throws -> Double {
        if totalPerson <= 0 {
            throw TipCalculateError.invalidInput
        }
        let tipAmount = try! calculateTip(amount: amount, tipPercent: tipPercent)
        
        let finalAmount = amount + tipAmount
        let finalAmountPerPerson = finalAmount/Double(totalPerson)
        
        return finalAmountPerPerson
    }
    
}
