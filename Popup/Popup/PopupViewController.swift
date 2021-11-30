//
//  PopupViewController.swift
//  Popup
//
//  Created by User on 2021/11/19.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func closePopup(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func donePopup(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}
