//
//  AdCellCollectionViewCell.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/28/22.
//

import UIKit

class AdCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var adCellView: UIView!
    @IBOutlet weak var imgAdPoster: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var adDetail: Ads? {
        didSet {
            if let data = adDetail {
                self.imgAdPoster.image = UIImage.init(named: data.itemImage)
                self.lblName.text = data.itemName
                self.lblPrice.text = data.price
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        adCellView.addShadow()
        adCellView.layer.cornerRadius = 5
    }

}
