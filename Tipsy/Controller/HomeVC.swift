//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var billTotalTF: UITextField!
    @IBOutlet weak var tipTotalTF: UITextField!
    @IBOutlet weak var splitLbl: UILabel!
    
    @IBOutlet weak var zeroPercentBtn: UIButton!
    @IBOutlet weak var tenPercentBtn: UIButton!
    @IBOutlet weak var twentyPrecentBtn: UIButton!
    
    let calcBrain = CalculatorBrain()
    
    @IBAction func tipPercentPressed(_ sender: UIButton) {
        billTotalTF.endEditing(true)
        tipTotalTF.endEditing(true)
        
        zeroPercentBtn.isSelected = sender.tag == 1
        tenPercentBtn.isSelected = sender.tag == 2
        twentyPrecentBtn.isSelected = sender.tag == 3
    }
    
    @IBAction func splitPressed(_ sender: UIStepper) {
        billTotalTF.endEditing(true)
        tipTotalTF.endEditing(true)
        
        splitLbl.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let vc = segue.destination as! ResultVC
            
            let cost = Float(billTotalTF.text ?? "0")
            let split = Float(splitLbl.text!)
            
            vc.total = billTotalTF.text
            if tipTotalTF.text != "" {
                vc.perPerson = calcBrain.calculateTip(cost: cost!, tip: Float(tipTotalTF.text!)!, split: split!)
                vc.tip = tipTotalTF.text!
            } else if zeroPercentBtn.isSelected {
                vc.perPerson = calcBrain.calculateTipPercent(cost: cost!, tip: 0.0, split: split!)
                vc.tip = zeroPercentBtn.titleLabel?.text
            } else if tenPercentBtn.isSelected {
                vc.perPerson = calcBrain.calculateTipPercent(cost: cost!, tip: 0.1, split: split!)
                vc.tip = tenPercentBtn.titleLabel?.text
            } else {
                vc.perPerson = calcBrain.calculateTipPercent(cost: cost!, tip: 0.2, split: split!)
                vc.tip = twentyPrecentBtn.titleLabel?.text
            }
            
            vc.split = splitLbl.text
        }
    }
}
