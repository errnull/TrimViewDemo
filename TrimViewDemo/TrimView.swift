//
//  TrimView.swift
//  TrimViewDemo
//
//  Created by 詹瞻 on 2018/5/17.
//  Copyright © 2018年 developZHAN. All rights reserved.
//

import UIKit

class TrimView: UIView {

    let maskLayer: CAShapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        maskLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        self.layer.addSublayer(maskLayer)
        self.layer.mask = maskLayer
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        maskLayer.frame = bounds
        self.layer.addSublayer(maskLayer)
        self.layer.mask = maskLayer
    }
    
    open var trimPercent: CGFloat = 1.0 {
        didSet {
            
            self.trimViewWithPercent(percent: trimPercent)
        }
    }

    func trimViewWithPercent(percent: CGFloat) {

        let viewSize = self.frame.size;
        let path = CGMutablePath()
        
        if percent > 0.5 {
            let truePercent = (percent - 0.5) * 2
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: viewSize.width * truePercent, y: 0))
            path.addLine(to: CGPoint(x: viewSize.width, y: viewSize.height * (1 - truePercent)))
            path.addLine(to: CGPoint(x: viewSize.width, y: viewSize.height))
            path.addLine(to: CGPoint(x: 0, y: viewSize.height))
            path.closeSubpath()
        } else {
            let truePercent = percent * 2
            path.move(to: CGPoint(x: 0, y: viewSize.height * (1 - truePercent)))
            path.addLine(to: CGPoint(x: viewSize.width * truePercent, y: viewSize.height))
            path.addLine(to: CGPoint(x: 0, y: viewSize.height))
            path.closeSubpath()
        }
        maskLayer.path = path
    }
}
