//
//  DashboardViewController.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/28/22.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var adCollectionView: UICollectionView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let adData: AdListResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search at OneKyat"
        navigationItem.searchController = searchController
        
        initData()
    }
    
    @IBAction func onTouchLogoutBtn(_ sender: Any) {
    }
}

extension DashboardViewController {
    func initData() {
        
    }
}

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return adData?.adList.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            
        }
    }
    
    
}

extension DashboardViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}
