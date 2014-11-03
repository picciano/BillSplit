//
//  ViewController.swift
//  BillSplit
//
//  Created by Anthony Picciano on 11/3/14.
//  Copyright (c) 2014 Crispin Porter + Bogusky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalAmountField: UITextField!
    @IBOutlet weak var numberOfSplitsLabel: UILabel!
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    var totalAmount = 10.0
    let formatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        
        updateDisplay()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        totalAmountField.resignFirstResponder()
        updateDisplay()
    }
    
    func updateDisplay() {
        totalAmountField.text = "\(formatCurrency(totalAmount))"
        numberOfSplitsLabel.text = "\(Int(splitStepper.value))"
        
        let splitAmount = totalAmount * Double(tipPercentageSlider.value) / splitStepper.value
        splitAmountLabel.text = "\(formatCurrency(splitAmount))"
    }

    @IBAction func stepperChanged(sender: AnyObject) {
        updateDisplay()
    }
    
    func formatCurrency(value:Double) -> String {
        return formatter.stringFromNumber(value)!
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        let field = sender as UITextField
        if let number = formatter.numberFromString(field.text) {
            totalAmount = number.doubleValue
        }
    }
    
    @IBAction func tipPercentageChanged(sender: AnyObject) {
        updateDisplay()
    }
}

