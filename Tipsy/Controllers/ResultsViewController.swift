//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Bening Ranum on 17/01/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var totalPizzaBox = 0
    var adultCount = 0
    var childCount = 0
    var adultPortion = 0
    var childPortion = 0
    var crustType: CrustType = .traditional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pizzaType = crustType == .traditional ? "traditional" : "thin"
        subtitleLabel.text = "boxes of \(pizzaType) pizza"
        totalLabel.text = "\(totalPizzaBox)"
        let splitInformation = "Split between \(adultCount) adults and \(childCount) children, each \(adultPortion) and \(childPortion) slices respectively"
        settingsLabel.text = splitInformation
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
