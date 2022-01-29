//
//  AdDetailViewController.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/29/22.
//

import UIKit

class AdDetailViewController: UIViewController {

    @IBOutlet weak var imgAdPoster: UIImageView!
    @IBOutlet weak var lblAdTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var lblSellerName: UILabel!
    @IBOutlet weak var lblSellerUserName: UILabel!
    @IBOutlet weak var lblSellerLocation: UILabel!
    @IBOutlet weak var lblPostedDate: UILabel!
    @IBOutlet weak var lblAdSubTitle: UILabel!
    @IBOutlet weak var lblItemCondition: UILabel!
    @IBOutlet weak var lblItemDescription: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var messageView: UIView!
    
    var adItemDetail: Ads?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupData(detail: adItemDetail)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension AdDetailViewController {
    func setupView() {
        
        tfMessage.layer.cornerRadius = tfMessage.bounds.height/2
        tfMessage.clipsToBounds = true
        messageView.addTopShadow()
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }else {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.view.backgroundColor = .clear
        }
    }
    
    func setupData(detail: Ads?) {
        if let data = detail {
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
    }
}
