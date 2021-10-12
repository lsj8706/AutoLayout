//
//  ViewController.swift
//  Floating Button
//
//  Created by User on 2021/10/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup"{
            let floatingVC = segue.destination as! FloatingButtonListViewController
            
            //배경을 투명하게 하기
            floatingVC.modalPresentationStyle = .overCurrentContext
        }
    }
}

