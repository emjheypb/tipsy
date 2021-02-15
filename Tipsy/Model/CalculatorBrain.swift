//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Mariah Baysic on 2/15/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    func calculateTip(cost: Float, tip: Float, split: Float) -> String {
        let totalCost = cost + tip
        let total = totalCost / split
        
        return String(format: "%.2f", total)
    }
    
    func calculateTipPercent(cost: Float, tip: Float, split: Float) -> String {
        let totalTip = cost * tip
        let totalCost = cost + totalTip
        let total = totalCost / split
        
        return String(format: "%.2f", total)
    }
    
    func getDescription() {
        
    }
}
