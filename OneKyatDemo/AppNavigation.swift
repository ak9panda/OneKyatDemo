//
//  AppNavigation.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/29/22.
//

import Foundation
import UIKit

struct AppNavigation {
    
    let storyboard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        
        let loginVC = self.storyboard.instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as? LoginViewController
        loginVC?.didCompleteLogin = LoginComplete
        self.window.rootViewController = loginVC
        self.window.makeKeyAndVisible()
    }
    
    fileprivate func LoginComplete() {
        let tabBarVC = self.storyboard.instantiateInitialViewController() as? UITabBarController
        self.window.rootViewController = tabBarVC
        self.window.makeKeyAndVisible()
    }
    
    func LogOutComplete() {
        let loginVC = self.storyboard.instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as? LoginViewController
        loginVC?.didCompleteLogin = LoginComplete
        self.window.subviews.forEach { $0.removeFromSuperview() }
        window.rootViewController = nil
        window.rootViewController = loginVC
        self.window.makeKeyAndVisible()
    }
}
