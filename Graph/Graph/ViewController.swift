//
//  ViewController.swift
//  Graph
//
//  Created by User on 2021/10/13.
//

import UIKit

extension NSLayoutConstraint {
    
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        
        //기존에 뷰가 가지고 있던 Constraint 설정 값을 비활성화
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem!, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        //기존의 오브젝트가 가지고 있던 Constraints들 가져오기
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        //내가 만든 newConstraint를 활성화
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
    
}



class ViewController: UIViewController {

    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    @IBOutlet weak var graph5Height: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func style1(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            self.graph1Height = self.graph1Height.changeMultiplier(value: 0.9)
            self.graph2Height = self.graph2Height.changeMultiplier(value: 0.8)
            self.graph3Height = self.graph3Height.changeMultiplier(value: 0.7)
            self.graph4Height = self.graph4Height.changeMultiplier(value: 0.6)
            self.graph5Height = self.graph5Height.changeMultiplier(value: 0.5)
            
            self.view.layoutIfNeeded()
        }
    }
    
    
    @IBAction func style2(_ sender: UIButton) {
        
        graph1Height = graph1Height.changeMultiplier(value: 0.5)
        graph2Height = graph2Height.changeMultiplier(value: 0.6)
        graph3Height = graph3Height.changeMultiplier(value: 0.7)
        graph4Height = graph4Height.changeMultiplier(value: 0.8)
        graph5Height = graph5Height.changeMultiplier(value: 0.9)
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    
}

