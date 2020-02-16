//
//  ViewController.swift
//  myCalculatorClassWork
//
//  Created by Xcode User on 2020-02-16.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let PLUS = 10
    let MINUS = 11
    let MULTIPLY = 12
    let DIVIDE = 13

    @IBOutlet var lblText: UILabel!
    
    var num1 :NSInteger = 0
    var num2 : NSInteger = 0
    var operand : NSInteger = 0
    var answer : Double = 0.0
    
    var theNumber: String = "0"
    
    @IBAction func calculate (sender: UIButton){
    num2 = Int(theNumber)!
        if operand == PLUS {
            answer = Double(num1 + num2)
        }
        
        if operand == MINUS{
            answer = Double(num1 - num2)
        }
        
        if operand == DIVIDE {
            if num2 == 0 {
               let alert  = UIAlertController(title: "Error", message: "Divide by zero", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                alert.addAction(cancelAction)
                present(alert, animated: true)
            }
            
               
            else {
            answer = Double(num1 / num2)
            }
        }
        
        if operand == MULTIPLY {
            answer = Double(num1 *  num2)
        }
        
        num1 = 0
        num2 = 0
        operand = PLUS
        theNumber = String(answer)
        printNumber()
        answer = 0.0
        theNumber = "0"
        
    }
    @IBAction func setOperand(sender: UIButton){
        if sender.tag >= 10 && sender.tag <= 13{
            operand = sender.tag
            saveNumber()
        }
        
        if sender.tag == -2 {
            theNumber = "0"
            printNumber()
        }
    }
    func saveNumber() {
        num1 = Int(theNumber)!
        theNumber = "0"
        printNumber()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        printNumber()
    }
    
    
    func printNumber() {
        lblText.text = theNumber
    }

    @IBAction func pressNum(sender: UIButton){
        
        if (sender.tag >= 0 && sender.tag <= 9){
            theNumber += String(sender.tag)
            printNumber()
            
        }
    }

}

