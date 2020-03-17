//
//  Utilities.swift
//  CustomLogin
//
//  Created by Md Kamrul Hasan on 17/3/20.
//  Copyright © 2020 Md Kamrul Hasan. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static func styleTextField(_ textfiled: UITextField) {
        /*Create the bottom line*/
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfiled.frame.height - 2, width: textfiled.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        /*Remove border on text field*/
        textfiled.borderStyle = .none
        
        /*Add the line to the text field*/
        textfiled.layer.addSublayer(bottomLine)
    }
    
    static func styleFieldButton(_ button: UIButton) {
        /*Filled rounded corner style*/
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button: UIButton) {
        /*Hollow rounded corner style*/
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        
        return passwordTest.evaluate(with: password)
        
    }
}
