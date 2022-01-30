//
//  DashboardRouter.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/30/22.
//

import Foundation
import UIKit

protocol DashboardRouterProtocol {
    func navigateToAdDetailViewController(viewController: UIViewController, data: Ads)
    func navigateToLoginViewController()
}

class DashboardRouter: DashboardRouterProtocol {
    func navigateToAdDetailViewController(viewController: UIViewController, data: Ads) {
        if let adDetailVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: AdDetailViewController.self)) as? AdDetailViewController {
            adDetailVC.adItemDetail = data
            viewController.navigationController?.pushViewController(adDetailVC, animated: true)
        }
    }
    
    func navigateToLoginViewController() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let appNavigation = AppNavigation(window: appDelegate.window!)
        appNavigation.LogOutComplete()
    }
}
