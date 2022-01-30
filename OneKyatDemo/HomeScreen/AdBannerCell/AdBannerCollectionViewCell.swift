//
//  AdBannerCollectionViewCell.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/28/22.
//

import UIKit

class AdBannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgBannerCollectionView: UICollectionView!
    @IBOutlet weak var bannerPageControl: UIPageControl!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private var currentPage = 0
    // timer for adbanner
    var carousalTimer: Timer?
    
    var posterList: [String]? = [] {
        didSet {
            if let data = posterList {
                carousalTimer?.invalidate()
                bannerPageControl.numberOfPages = data.count
                self.imgBannerCollectionView.reloadData()
                self.startScroll()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgBannerCollectionView.dataSource = self
        imgBannerCollectionView.delegate = self
        imgBannerCollectionView.register(AdCoverCell.self, forCellWithReuseIdentifier: AdCoverCell.identifier)
    }
}

extension AdBannerCollectionViewCell {
    
    func startScroll() {
        carousalTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.scrollToNextCell), userInfo: nil, repeats: true);
    }
    
    @objc func scrollToNextCell(){
        if currentPage < posterList!.count - 1 {
            currentPage = currentPage + 1
        }else {
            currentPage = 0
        }
        bannerPageControl.currentPage = currentPage
        imgBannerCollectionView.scrollToItem(
            at: IndexPath(item: currentPage, section: 0),
            at: .right,
            animated: true
        )
    }
}

extension AdBannerCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posterList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: AdCoverCell.identifier, for: indexPath) as? AdCoverCell else {
            return UICollectionViewCell()
        }
        if let poster = posterList?[indexPath.row] {
            cell.poster = poster
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currentPage = indexPath.row
        bannerPageControl.currentPage = currentPage
    }
}

extension AdBannerCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
