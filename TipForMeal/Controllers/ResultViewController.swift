//
//  ResultViewController.swift
//  TipForMeal
//
//  Created by Sora on 11.06.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var calculatedResult: Double?
    var numberOfPeople: Int?
    var tipPercentage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let calculation = calculatedResult, let people = numberOfPeople, let tip = tipPercentage {
            totalLabel.text = String(calculation)
            resultLabel.text = "Split between \(people) people, with \(tip) tip."
        }
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
