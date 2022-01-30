//
//  DashboardPresenter.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/30/22.
//

import Foundation
import UIKit

protocol DashboardPresenterProtocol: AnyObject {
    var view: DashboardViewProtocol? { get set }
    var interactor: DashboardInteractorProtocol? { get set }
    var router: DashboardRouterProtocol? { get set }
    
    func fetchAdData()
    func showAdDetail(viewController: UIViewController, data: Ads)
    func handleLogout()
}

class DashboardPresenter: DashboardPresenterProtocol {
    weak var view: DashboardViewProtocol?
    var interactor: DashboardInteractorProtocol?
    var router: DashboardRouterProtocol?
    
    func fetchAdData() {
        interactor?.retrieveAdData()
    }
    
    func showAdDetail(viewController: UIViewController, data: Ads) {
        self.router?.navigateToAdDetailViewController(viewController: viewController, data: data)
    }
    
    func handleLogout() {
        self.router?.navigateToLoginViewController()
    }
}
