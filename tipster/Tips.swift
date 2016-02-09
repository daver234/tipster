//
//  Tips.swift
//  tipster
//
//  Created by David Rothschild on 1/8/16.
//  Copyright © 2016 Dave Rothschild. All rights reserved.
//

import Foundation


class Tips {
    var totalCalc : Double = 0.00
    var appendNum = ""
    var totalCalcString = ""
    var tipPercent = 0.05
    var tipAmount1: Double = 1.0
    var tipAmount2: Double = 1.0
    var tipAmount3: Double = 1.0
    
    var tipTotalAmount1: Double = 0.0
    var tipTotalAmount2: Double = 0.0
    var tipTotalAmount3: Double = 0.0
    
    var tipTotalAmountString = ""

    var tipPercentAmount: Double = 1.00
    var tipPercentAmountString = ""
    
    var numInGroup: Double = 1.00
    
    
    func calc(sender: Int) {
        if sender == 10 {
            totalCalcString += "."
        } else {
        print("here is sender \(sender)")
        // build string of numbers, first convert sender to string
        appendNum = String(sender)
        // here is string will all numbers
        totalCalcString += appendNum
        
        // convert string of numbers into a float
        totalCalc = NSString(string: totalCalcString).doubleValue
        tipAmountFunc(totalCalc)
        tipTotalFunc(totalCalc)
        }
        
    }
   
    func percentChangeFunc(data: Double) {
        tipPercent = data/100
        totalCalc *= 1
        tipAmountFunc(totalCalc)
        tipTotalFunc(totalCalc)
        
    }
    
    func groupSliderChange(data: Double) {
        numInGroup = data
        tipAmountFunc(totalCalc)
        tipTotalFunc(totalCalc)
        
    }
    
    func tipAmountFunc(data : Double) {
        tipAmount1 = (tipPercent * data)/numInGroup
        tipAmount2 = ( (tipPercent + 0.05) * data) / numInGroup
        tipAmount3 = ( (tipPercent + 0.10) *  data) / numInGroup

    }
    
    func tipTotalFunc(data: Double) {
        tipTotalAmount1 = (data * (1 + tipPercent) ) / numInGroup
        tipTotalAmount2 = ( data * (1.05 + tipPercent) ) / numInGroup
        tipTotalAmount3 = ( data * (1.10 + tipPercent) ) / numInGroup
        tipTotalAmountString = String(tipTotalAmount1)
        
    }
    
    func clearClassVars() {
        totalCalc = 0
        totalCalcString = ""
        tipPercent = 0.10
        tipAmount1 = 1.0
        tipAmount2 = 1.0
        tipAmount3 = 1.0
        tipTotalAmount1 = 1.00
        tipTotalAmount2 = 1.00
        tipTotalAmount3 = 1.00
        tipPercentAmount = 1.00
        tipPercentAmountString = ""
        tipTotalAmountString = ""
    }
    
    
}