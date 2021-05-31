//
//  ViewController.swift
//  MyCalculator
//
//  Created by dev-lsz on 2021/5/28.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayLabel.text! = ""
    }
    
    var digitOnDisplay: String{
        get{
            return self.displayLabel.text!
        }
        
        set{
            return self.displayLabel.text! = newValue
        }
    }

    var inTypingMode = false
    
    @IBAction func numberTouched(_ sender: UIButton) {
        //print("number \(sender.currentTitle!) touched")
        if inTypingMode {
            digitOnDisplay = digitOnDisplay + sender.currentTitle!
        }else{
            digitOnDisplay = sender.currentTitle!
            inTypingMode = true;
        }
    }
    
    
    let calculator = Calculator()
    @IBAction func operatorTouched(_ sender: UIButton) {
        //print("operator \(sender.currentTitle!) touched")
        if let op = sender.currentTitle{
            if let result = calculator.performOpenation(operation: op, operand: Double(digitOnDisplay)!) {
                digitOnDisplay = String(result)
            }
            inTypingMode = false
        }
        
    }
    
}

