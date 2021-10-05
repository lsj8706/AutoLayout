//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by User on 2021/10/05.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {

    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //xib 파일 불러오기
        let myKeyboard = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        
        //xib파일에 있는 첫번째 view 가져오기
        let myKeyboardView = myKeyboard?.first as! CustomKeyboard
        myKeyboardView.delegate = self
        
        //커스텀 키보드 설정 방법 (키보드가 차지해야할 크기에 맞추어서 자동으로 커스텀 키보드가 들어가게 됨)
        firstTextField.inputView = myKeyboardView
        
    }
    
    //Protocol
    func keyboardTapped(value: String) {
        
        if let currentNumber = firstTextField.text?.replacingOccurrences(of: ",", with: ""){
            
            let newNumber = currentNumber + value
            
            //큰 숫자를 3자리마다 ,를 넣어 줌
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            if let intNumber = Int(newNumber){
                if let formatted = numberFormatter.string(from: NSNumber(value: intNumber)){
                
                    firstTextField.text = formatted
                }
            }
            
            
        } else{
            firstTextField.text = value
        }
        
    }
}

