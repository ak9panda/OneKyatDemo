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
    
    var presenter: DashboardPresenterProtocol?
    var adData: AdListResponse? {
        didSet {
            if let _ = adData {
                self.adCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        setupView()
        self.presenter?.fetchAdData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onTouchLogoutBtn(_ sender: Any) {
        self.showAlertTwoBtn(title: "Logout?", message: "Are you sure.") { _ in
            self.presenter?.handleLogout()
        }
    }
}

// MARK: - Helper Functions
extension DashboardViewController {
    // setup viper protocols here
    private func initView() {
        let presenter = DashboardPresenter()
        let interactor = DashboardInteractor()
        let router = DashboardRouter()
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = self
        
        interactor.presenter = presenter
        
        self.presenter = presenter
    }
}

// MARK: - UICollectionView Delegate
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
        if let data = adDetail {
            presenter?.showAdDetail(viewController: self, data: data)
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
