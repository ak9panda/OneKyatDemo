//
//  AdDetailPresenter.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/30/22.
//

import Foundation
import UIKit

protocol AdDetailPresenterProtocol: AnyObject {
    var view: AdDetailViewProtocol? { get set }
    var interactor: AdDetailInteractorProtocol? { get set }
    var router: AdDetailRouterProtocol? { get set }
    
    func setData(data: Ads)
    func dialPhone(number: String)
    func backToDashboard(viewController: UIViewController)
}

class AdDetailPresenter: AdDetailPresenterProtocol{
    weak var view: AdDetailViewProtocol?
    var interactor: AdDetailInteractorProtocol?
    var router: AdDetailRouterProtocol?
    
    func setData(data: Ads) {
        view?.bindAdDetail(data: data)
    }
    
    func backToDashboard(viewController: UIViewController) {
        router?.navigateToDashboardViewController(viewController: viewController)
    }
    
    func dialPhone(number: String) {
        view?.dialNumber(number: number)
    }
}
