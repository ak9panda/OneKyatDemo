//
//  DashboardInteractor.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/30/22.
//

import Foundation

protocol DashboardInteractorProtocol {
    var presenter: DashboardPresenterProtocol? { get set }
    
    func retrieveAdData()
}

class DashboardInteractor: DashboardInteractorProtocol {
    var presenter: DashboardPresenterProtocol?
    
    func retrieveAdData() {
        if let path = Bundle.main.path(forResource: "OneKyatAd", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do {
                    let adData = try JSONDecoder().decode(AdListResponse.self, from: jsonData)
                    presenter?.view?.bindAdData(data: adData)
                }catch {
                    
                }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
}
