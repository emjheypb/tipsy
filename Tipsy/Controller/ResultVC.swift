//
//  ResultVC.swift
//  Tipsy
//
//  Created by Mariah Baysic on 2/15/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var splitLbl: UILabel!
    
    var total: String?
    var perPerson: String?
    var split: String?
    var tip: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLbl.text = perPerson ?? "0.0"
        if let totalPrice = total, let splitCheck = split, let tipCheck = tip {
            splitLbl.text = "\(totalPrice) split between \(splitCheck) people, with \(tipCheck) tip"
        } else {
            splitLbl.text = "Error Computing Total per Person"
        }
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
