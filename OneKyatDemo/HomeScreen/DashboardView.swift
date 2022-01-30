//
//  DashboardView.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/30/22.
//

import Foundation
import UIKit

protocol DashboardViewProtocol: AnyObject {
    func bindAdData(data: AdListResponse)
}

extension DashboardViewController: DashboardViewProtocol {
    func setupView() {
        searchBar.searchTextField.placeholder = "Search at OneKyat"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        navigationItem.backButtonTitle = ""
        
        adCollectionView.dataSource = self
        adCollectionView.delegate = self
        let adBannerCell = UINib(nibName: AdBannerCollectionViewCell.identifier, bundle: nil)
        adCollectionView.register(adBannerCell, forCellWithReuseIdentifier: AdBannerCollectionViewCell.identifier)
        let adCell = UINib(nibName: AdCellCollectionViewCell.identifier, bundle: nil)
        adCollectionView.register(adCell, forCellWithReuseIdentifier: AdCellCollectionViewCell.identifier)
    }
    
    func bindAdData(data: AdListResponse) {
        self.adData = data
    }
}

extension DashboardViewController: UISearchBarDelegate {
    
}
