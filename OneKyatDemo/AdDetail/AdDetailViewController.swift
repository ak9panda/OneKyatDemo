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
    private var presenter: AdDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        setupView()

        if let data = adItemDetail {
            presenter?.setData(data: data)
        }
    }
    
    @IBAction func onTouchBackBtn(_ sender: Any) {
        presenter?.backToDashboard(viewController: self)
    }
    
    @IBAction func onTouchPhCallBtn(_ sender: Any) {
        self.presenter?.dialPhone(number: "09420000002")
    }
}

// MARK: - Helper Functions
extension AdDetailViewController {
    // setup viper protocols here
    private func initView() {
        let presenter = AdDetailPresenter()
        let interactor = AdDetailInteractor()
        let router = AdDetailRouter()
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = self
        
        interactor.presenter = presenter
        
        self.presenter = presenter
    }
}
