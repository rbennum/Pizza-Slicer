//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

enum HungerLevel: Int {
    case notVery = -1
    case hungry = 0
    case starving = 1
}

enum CrustType: Int {
    case traditional = 0
    case thin = 1
}

class CalculatorViewController: UIViewController {
    @IBOutlet weak var adultCountTextField: UITextField!
    @IBOutlet weak var childCountTextField: UITextField!
    @IBOutlet weak var notVeryHungryButton: UIButton!
    @IBOutlet weak var hungryButton: UIButton!
    @IBOutlet weak var starvingButton: UIButton!
    @IBOutlet weak var traditionalCrustButton: UIButton!
    @IBOutlet weak var thinCrustButton: UIButton!
    
    var hungerLevel: HungerLevel = .hungry
    var crustType: CrustType = .traditional
    
    var totalPizzaBox = 0
    var adultCount = 0
    var childCount = 0
    var adultPortion = 0
    var childPortion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHideKeyboard()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            guard let destinationVC = segue.destination as? ResultsViewController else { return }
            
            destinationVC.totalPizzaBox = totalPizzaBox
            destinationVC.adultCount = adultCount
            destinationVC.childCount = childCount
            destinationVC.adultPortion = adultPortion
            destinationVC.childPortion = childPortion
            destinationVC.crustType = crustType
        }
    }
    
    @IBAction func hungerLevelChanged(_ sender: UIButton) {
        notVeryHungryButton.isSelected = false
        hungryButton.isSelected = false
        starvingButton.isSelected = false
        
        sender.isSelected = true
        
        switch sender.tag {
        case 1:
            hungerLevel = .notVery
            break
        case 2:
            hungerLevel = .hungry
            break
        default:
            hungerLevel = .starving
            break
        }
    }
    
    @IBAction func crustLevelChanged(_ sender: UIButton) {
        traditionalCrustButton.isSelected = false
        thinCrustButton.isSelected = false
        sender.isSelected = true
        crustType = sender.tag == 0 ? .traditional : .thin
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let hungerInInt = hungerLevel.rawValue
        let crustInInt = crustType.rawValue
        adultCount = Int(adultCountTextField.text ?? "") ?? 0
        childCount = Int(childCountTextField.text ?? "") ?? 0
        adultPortion = adultCount * (AppConstants.ADULT_PORTION + hungerInInt + crustInInt)
        childPortion = childCount * (AppConstants.CHILD_PORTION + hungerInInt + crustInInt)
        let totalPortion = adultPortion + childPortion
        totalPizzaBox = totalPortion / AppConstants.PIZZA_SLICES + (totalPortion % AppConstants.PIZZA_SLICES != 0 ? 1 : 0)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
}

private extension CalculatorViewController {
    func initializeHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissSoftKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissSoftKeyboard() {
        view.endEditing(true)
    }
}
