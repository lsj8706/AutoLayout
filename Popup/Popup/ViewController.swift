//
//  ViewController.swift
//  Popup
//
//  Created by User on 2021/11/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showPopup(_ sender: UIButton) {
        
        // 1. PopupViewController 스토리보드 가져오기
        let storyBoard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        
        // 2. VC 가져오기
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "popupVC")
        // 1,2번은 일종의 공식과 같은 방법
        
        // 투명도(opacity)가 배경화면에 있다면 해당 VC에 투명도를 적용시킴 (투명도가 필요하다면 꼭 해줘야 함)
        popupVC.modalPresentationStyle = .overCurrentContext
        
        // 해당 VC 띄우기
        self.present(popupVC, animated: false) {
        }
        
    }
    
}

