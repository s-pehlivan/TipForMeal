//
//  ViewController.swift
//  TipForMeal
//
//  Created by Sora on 11.06.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var isBillTextEmpty = true
    var calculatorBrain = CalculatorBrain()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        zeroButton.isSelected = true
    }
    
   

    @IBAction func tipChoicePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        if let title = sender.currentTitle {
            calculatorBrain.getTipPercentage(tipPerc: title)
            switch title {
            case "0%":
                zeroButton.isSelected = true
                tenButton.isSelected = false
                twentyButton.isSelected = false
            case "10%":
                zeroButton.isSelected = false
                tenButton.isSelected = true
                twentyButton.isSelected = false
            default:
                zeroButton.isSelected = false
                tenButton.isSelected = false
                twentyButton.isSelected = true
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        calculatorBrain.getSplitNumber(split: sender.value)
        splitNumberLabel.text = calculatorBrain.printSplitNumber()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.getBillText(bill: billTextField.text)
        calculatorBrain.calcMoney()
        self.performSegue(withIdentifier: "toResult", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.calculatedResult = calculatorBrain.calculation.moneyPerPerson ?? 0.0
        destinationVC.tipPercentage = calculatorBrain.calculation.tipAmountText ?? "0.0"
        destinationVC.numberOfPeople = calculatorBrain.calculation.splitNumber ?? 2
    }
    
    
}

