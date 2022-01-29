//
//  LoginViewController.swift
//  OneKyatDemo
//
//  Created by Aung Kyaw Phyo on 1/28/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfPhoneNo: UITextField!
    @IBOutlet weak var PhoneNoView: UIView!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var PasswordView: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnTandC: UIButton!
    @IBOutlet weak var btnCheckbox: UIButton!
    
    // Images
    let checkedImage = UIImage(named: "checkbox_filled")! as UIImage
    let uncheckedImage = UIImage(named: "checkbox_empty")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                btnCheckbox.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                btnCheckbox.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfPhoneNo.delegate = self
        tfPassword.delegate = self
        
        PhoneNoView.addBottomShadow(shadowDepth: 0.5)
        PasswordView.addBottomShadow(shadowDepth: 0.5)
        btnTandC.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func onTouchLoginBtn(_ sender: Any) {
    }
    
    @IBAction func onTouchTandCBtn(_ sender: Any) {
        
    }
    
    @IBAction func onTouchCheckboxBtn(_ sender: Any) {
        isChecked = !isChecked
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case tfPhoneNo:
            PhoneNoView.addBottomShadow(shadowDepth: 1.0)
        case tfPassword:
            PasswordView.addBottomShadow(shadowDepth: 1.0)
        default:
            PhoneNoView.addBottomShadow(shadowDepth: 0.5)
            PasswordView.addBottomShadow(shadowDepth: 0.5)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case tfPhoneNo:
            PhoneNoView.addBottomShadow(shadowDepth: 0.5)
        case tfPassword:
            PasswordView.addBottomShadow(shadowDepth: 0.5)
        default:
            PhoneNoView.addBottomShadow(shadowDepth: 0.5)
            PasswordView.addBottomShadow(shadowDepth: 0.5)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
