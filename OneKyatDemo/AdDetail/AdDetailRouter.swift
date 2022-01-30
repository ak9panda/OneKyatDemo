//
//  AdDetailRouter.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/30/22.
//

import Foundation
import UIKit

protocol AdDetailRouterProtocol {
    func navigateToDashboardViewController(viewController: UIViewController)
}

class AdDetailRouter: AdDetailRouterProtocol {
    func navigateToDashboardViewController(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
