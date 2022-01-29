//
//  UIViewController+Extension.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/29/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertOneBtn(title: String, message: String, alertAction: @escaping (UIAlertAction)->() = {_ in }) {
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: alertAction))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showAlertTwoBtn(title: String, message: String, alertAction: @escaping (UIAlertAction)->() = {_ in }) {
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        alertVC.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: alertAction))
        self.present(alertVC, animated: true, completion: nil)
    }
}
