//
//  DiagonalCustomImageView.swift
//  CustomLayout_Connect_Storyboard
//
//  Created by User on 2021/10/14.
//

import UIKit

@IBDesignable   //storyboard와 연결하는 방법 자동완성 안되기 때문에 숙지해야 함
class DiagonalCustomImageView: UIImageView {

    // 대각선으로 잘린 사각형을 그린다
    // BezierPath
    
    // path -> layer
    // layer -> mask
    
    // 내가 만든 커스텀 코드 => storyboard 편집화면에서 바로 확인
    
    
    @IBInspectable var innerHeight: CGFloat = 0 //storyboard의 Inspector에서 값을 변경할 수 있게 함
    
    // 1단계
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        
        //연필로 선을 그리는 과정과 같다 (사각형 모양)
        path.move(to: CGPoint.zero) //path.move(to: CGPoint.init(x: 0, y: 0)) 와 같은 기능
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))  // 이미지의 오른쪽 끝으로 이동
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height)) // 이미지의 오른쪽 끝에서 가장 아래로 이동
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight)) // 이미지의 왼쪽 하단으로 이동, 원하는 만큼 대각선으로 잘려야 하기 때문에 y좌표에 필요한 만큼을 빼야함
        path.close() //path 그리기 끝내기
        
        return path
    }
    
    // 2단계
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath //BezierPath를 CGPath로 변환
        
        return shapeLayer
    }
    
    // 3단계
    func makeMask() {
        self.layer.mask = pathToLayer() //layer를 masking 함
    }
    
    // 1~3 단계 함수들이 해당 View가 그려질 때 자동으로 실행되게 함 (viewDidLoad 처럼)
    override func layoutSubviews() {
        makeMask()
    }
    
}
