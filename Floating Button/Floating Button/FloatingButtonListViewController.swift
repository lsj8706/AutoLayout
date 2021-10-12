//
//  FloatingButtonListViewController.swift
//  Floating Button
//
//  Created by User on 2021/10/13.
//

import UIKit

class FloatingButtonListViewController: UIViewController {

    @IBOutlet weak var btn1CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn2CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn3CenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btn1CenterY.constant = 0
        btn2CenterY.constant = 0
        btn3CenterY.constant = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseOut) {
    
            self.btn1CenterY.constant = 80
            self.btn2CenterY.constant = 160
            self.btn3CenterY.constant = 240
            
            self.view.layoutIfNeeded()  //이걸 꼭 써줘야 갱신이 됨.
        } completion: { completion in
            //애니메이션이 끝나는 시점에서 실행
        }
    }
    
    @IBAction func dismissFloating(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut) {
    
            self.btn1CenterY.constant = 0
            self.btn2CenterY.constant = 0
            self.btn3CenterY.constant = 0
            
            self.view.layoutIfNeeded()  //이걸 꼭 써줘야 갱신이 됨.
        } completion: { completion in
            //애니메이션이 끝나는 시점에서 실행
            
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    
    
}
