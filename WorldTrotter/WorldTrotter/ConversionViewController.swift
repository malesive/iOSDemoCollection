//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by June801 on 16/1/8.
//  Copyright © 2016年 June801. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
//            print("\(oldValue)")
        }
    }
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    let numberFormatter: NSNumberFormatter = {
       let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    final func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)//"\(value)"
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
//        if let text = textField.text where !text.isEmpty {
//            celsiusLabel.text = text
//        } else {
//            celsiusLabel.text = "???"
//        }
        if let text = textField.text, value = Double(text) {
//            let value = Double(text)
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func testCallBack(sender: UITextField) {
        print("edit ended!")
    }
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        print("Current text: \(textField.text)")
//        print("Replacement text: \(string),and range: \(range)")
//        
//        return true
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        }
        else {
            let countOfCharacters = textField.text?.characters.count
            print("countOfCharacters = \(countOfCharacters)")
            let replacementTextHasZero = string.rangeOfString("0")
            if countOfCharacters != nil && countOfCharacters == 1 && replacementTextHasZero != nil {
                return false
            }
//            if let str = textField.text {
////                let rangeOfTheRest = Range(start: advance(str.startIndex,1), end: str.endIndex)
////                print("sub: \(str.substringFromIndex(Index))")
//                let str2 = str as NSString
//                let subStr = str2.substringWithRange(NSRange(location: 1, length: countOfCharacters!-1))
//                print("subStr = \(subStr)")
//            }
            
            
            return true
        }
        
        
    }
    
    //Silver Challenge: Dark Mode
//    var modeFlag: Bool = false {
//        didSet {
//            if modeFlag {
//                view.backgroundColor = UIColor.lightGrayColor()
//            }
//            else {
//                view.backgroundColor = UIColor.purpleColor()
//            }
//        }
//    }
//    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        modeFlag = !modeFlag
//    }
    
}
