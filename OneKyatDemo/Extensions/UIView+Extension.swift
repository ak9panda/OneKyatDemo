//
//  UIView+Extension.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/28/22.
//

import UIKit

extension UIView {
    func addBottomShadow(shadowDepth: Float) {
        layer.masksToBounds = false
        layer.shadowRadius = 0.5
        layer.shadowOpacity = shadowDepth
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 2)
        layer.shadowPath = UIBezierPath(rect: CGRect(x: 0,
                                                     y: bounds.maxY - layer.shadowRadius,
                                                     width: UIScreen.main.bounds.width - 60,
                                                     height: 1)).cgPath
    }
    
    func addTopShadow() {
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -2)
        layer.shadowPath = UIBezierPath(rect: CGRect(x: -1,
                                                     y: -1,
                                                     width: self.bounds.width,
                                                     height: self.layer.shadowRadius)).cgPath
    }
}
