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
    var newOffsetX: CGFloat = 0.0
    
    var posterList: [String]? = [] {
        didSet {
            if let data = posterList {
                bannerPageControl.numberOfPages = data.count
                bannerPageControl.currentPage = 0
                self.imgBannerCollectionView.reloadData()
//                self.startTimer()
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
    func startTimer() {
        carousalTimer = Timer(fire: Date(), interval: 0.025, repeats: true) { (timer) in
            let initailPoint = CGPoint(x: self.newOffsetX,y :0)
            if __CGPointEqualToPoint(initailPoint, self.imgBannerCollectionView.contentOffset) {
                if self.newOffsetX < self.imgBannerCollectionView.contentSize.width {
                    self.newOffsetX += 0.25
                }
                if self.newOffsetX > self.imgBannerCollectionView.contentSize.width - self.imgBannerCollectionView.frame.size.width {
                    self.newOffsetX = 0
                }
                self.imgBannerCollectionView.contentOffset = CGPoint(x: self.newOffsetX,y :0)
            } else {
                self.newOffsetX = self.imgBannerCollectionView.contentOffset.x
            }
        }
        RunLoop.current.add(carousalTimer!, forMode: .common)
    }
    
    @objc func scrollToNextCell(){
        
        bannerPageControl.currentPage = currentPage
        if currentPage == 7 {
            currentPage = 0
        }
        imgBannerCollectionView.isPagingEnabled = true
        imgBannerCollectionView.scrollToItem(
            at: IndexPath(item: currentPage, section: 0),
            at: .centeredHorizontally,
            animated: true
        )
        self.imgBannerCollectionView.setNeedsLayout()
        currentPage += 1
    }
    
    func startScroll() {
        _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNextCell), userInfo: nil, repeats: true);
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
}

extension AdBannerCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 10;
        return CGSize(width: width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
