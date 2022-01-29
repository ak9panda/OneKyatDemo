//
//  AdCoverCell.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/29/22.
//

import UIKit

class AdCoverCell: UICollectionViewCell {
    
    let imageViewPoster : UIImageView = {
        let ui = UIImageView()
        ui.translatesAutoresizingMaskIntoConstraints = false
        ui.contentMode = UIView.ContentMode.scaleAspectFill
        return ui
    }()
    
    var poster: String? {
        didSet {
            if let img = poster {
                imageViewPoster.image = UIImage.init(named: img)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageViewPoster)
        imageViewPoster.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewPoster.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageViewPoster.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            imageViewPoster.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageViewPoster.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static var identifier : String {
        return String(describing: self)
    }
}
