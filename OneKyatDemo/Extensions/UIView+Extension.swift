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
                                                     y: layer.frame.size.height,
                                                     width: UIScreen.main.bounds.width - 60,
                                                     height: layer.shadowRadius)).cgPath
    }
}
