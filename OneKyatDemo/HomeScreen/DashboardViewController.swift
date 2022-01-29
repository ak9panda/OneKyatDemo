//
//  DashboardViewController.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/28/22.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var adCollectionView: UICollectionView!
    
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    
    var adData: AdListResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onTouchLogoutBtn(_ sender: Any) {
    }
}


extension DashboardViewController {
    func initData() {
        if let path = Bundle.main.path(forResource: "OneKyatAd", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do {
                    adData = try JSONDecoder().decode(AdListResponse.self, from: jsonData)
                    adCollectionView.reloadData()
                }catch {
                    
                }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    func initView() {
        
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
            guard let adBannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: AdBannerCollectionViewCell.identifier, for: indexPath) as? AdBannerCollectionViewCell else { return UICollectionViewCell() }
            adBannerCell.posterList = adData?.bannerImages
            return adBannerCell
        }else {
            guard let adCell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCellCollectionViewCell.identifier, for: indexPath) as? AdCellCollectionViewCell else { return UICollectionViewCell() }
            let ad = adData?.adList[indexPath.row]
            adCell.adDetail = ad
            return adCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let adDetail = adData?.adList[indexPath.row]
        if let adDetailVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: AdDetailViewController.self)) as? AdDetailViewController {
            adDetailVC.adItemDetail = adDetail
            self.navigationController?.pushViewController(adDetailVC, animated: true)
        }
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30)/2;
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width, height: width)
        }else {
            return CGSize(width: width, height: width * 1.2)
        }
    }
}

extension DashboardViewController: UISearchBarDelegate {
    
}
