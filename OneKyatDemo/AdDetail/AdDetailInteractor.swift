//
//  AdDetailInteractor.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/30/22.
//

import Foundation

protocol AdDetailInteractorProtocol {
    var presenter: AdDetailPresenterProtocol? { get set }
}

class AdDetailInteractor: AdDetailInteractorProtocol {
    var presenter: AdDetailPresenterProtocol?
}
