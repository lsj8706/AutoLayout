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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.layer.cornerRadius = 30
        resultLabel.layer.masksToBounds = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        btn1.layer.cornerRadius = btn1.bounds.width / 2
    }


}

