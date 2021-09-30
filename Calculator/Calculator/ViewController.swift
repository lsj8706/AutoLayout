//
//  ViewController.swift
//  Calculator
//
//  Created by User on 2021/09/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    @IBOutlet weak var btn12: UIButton!
    @IBOutlet weak var btn13: UIButton!
    @IBOutlet weak var btn14: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.layer.cornerRadius = 30
        resultLabel.layer.masksToBounds = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        btn1.layer.cornerRadius = btn1.bounds.width / 2
        btn2.layer.cornerRadius = btn1.bounds.width / 2
        btn3.layer.cornerRadius = btn1.bounds.width / 2
        btn4.layer.cornerRadius = btn1.bounds.width / 2
        btn5.layer.cornerRadius = btn1.bounds.width / 2
        btn6.layer.cornerRadius = btn1.bounds.width / 2
        btn7.layer.cornerRadius = btn1.bounds.width / 2
        btn8.layer.cornerRadius = btn1.bounds.width / 2
        btn9.layer.cornerRadius = btn1.bounds.width / 2
        btn10.layer.cornerRadius = btn1.bounds.width / 2
        btn11.layer.cornerRadius = btn1.bounds.width / 2
        btn12.layer.cornerRadius = btn1.bounds.width / 2
        btn13.layer.cornerRadius = btn1.bounds.width / 2
        btn14.layer.cornerRadius = btn1.bounds.height / 2

    }


}

