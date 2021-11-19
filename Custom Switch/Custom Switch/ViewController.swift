//
//  ViewController.swift
//  Custom Switch
//
//  Created by User on 2021/11/18.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var switchBG: UIView!
    
    @IBOutlet weak var buttonCenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchBtn.layer.cornerRadius = 50 / 2
        switchBG.layer.cornerRadius = 50 / 2
        
    }

    @IBAction func selectedButton(_ sender: UIButton) {
        
        if buttonCenterX.constant == 75{
            buttonCenterX.constant = -75
            switchBG.backgroundColor = UIColor.lightGray
        }
        else{
            buttonCenterX.constant = 75
            switchBG.backgroundColor = UIColor.green
        }
        
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }

    }
    
}

