//
//  AdDetailView.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/30/22.
//

import Foundation
import UIKit

protocol AdDetailViewProtocol: AnyObject {
    func bindAdDetail(data: Ads)
    func dialNumber(number: String)
}

extension AdDetailViewController: AdDetailViewProtocol {
    
    func setupView() {
        tfMessage.layer.cornerRadius = tfMessage.bounds.height/2
        tfMessage.clipsToBounds = true
        messageView.addTopShadow()
    }
    
    func bindAdDetail(data: Ads) {
        imgAdPoster.image = UIImage(named: data.itemImage)
        lblAdTitle.text = data.itemName
        lblPrice.text = data.price
        imgUserProfile.image = UIImage(named: data.sellerImage ?? "")
        lblSellerName.text = data.sellerName
        lblSellerUserName.text = data.sellerUserName
        lblSellerLocation.text = data.sellerLocation
        lblPostedDate.text = data.time
        lblAdSubTitle.text = data.itemName + " " + data.itemDetail
        lblItemCondition.text = data.itemCondition
        lblItemDescription.text = data.itemDescription
    }
    
    func dialNumber(number : String) {
        if let url = URL(string: "tel://\(number)"),
        UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            self.showAlertOneBtn(title: "Error", message: "Something went wrong")
        }
    }
}
