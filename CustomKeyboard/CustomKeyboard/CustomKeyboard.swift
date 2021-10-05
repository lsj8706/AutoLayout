//
//  CustomKeyboard.swift
//  CustomKeyboard
//
//  Created by User on 2021/10/05.
//

import UIKit

protocol CustomKeyboardDelegate{
    func keyboardTapped(value: String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardDelegate?

    @IBAction func buttonTapped(_ sender: UIButton) {
        
    if let buttonTitle = sender.titleLabel?.text{
        delegate?.keyboardTapped(value: buttonTitle)
    }

    }
    
}
