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
    
    private var checkPhoneNo: Bool = false
    private var checkPassword: Bool = false
    private var checkTandCBox: Bool = false
    
    var didCompleteLogin: () -> () = {}
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PhoneNoView.addBottomShadow(shadowDepth: 0.5)
        PasswordView.addBottomShadow(shadowDepth: 0.5)
        btnTandC.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        loginBtnToggle(status: false)
    }

    @IBAction func onTouchLoginBtn(_ sender: Any) {
        if tfPhoneNo.text == "09420000001" && tfPassword.text == "password_123$#" {
            didCompleteLogin()
        } else {
            self.showAlertOneBtn(title: "Error", message: "User name or password is incorrect!")
        }
//        didCompleteLogin()
    }
    
    @IBAction func onTouchTandCBtn(_ sender: Any) {
        if let url = URL(string: "https://www.onekyat.com/") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func onTouchCheckboxBtn(_ sender: Any) {
        isChecked = !isChecked
        checkTandCBox = isChecked
        checkLoginData()
    }
}

// MARK: - Helper Functions
extension LoginViewController {
    func checkLoginData() {
        if checkPhoneNo && checkPassword && checkTandCBox {
            loginBtnToggle(status: true)
        }else {
            loginBtnToggle(status: false)
        }
    }
    
    func loginBtnToggle(status: Bool) {
        if status {
            self.btnLogin.isUserInteractionEnabled = true
            self.btnLogin.layer.opacity = 1.0
        }else {
            self.btnLogin.isUserInteractionEnabled = false
            self.btnLogin.layer.opacity = 0.3
        }
    }
}

// MARK: - UITextField Delegate
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
            checkPhoneNo = tfPhoneNo.text?.count != 0 ? true : false
        case tfPassword:
            PasswordView.addBottomShadow(shadowDepth: 0.5)
            checkPassword = tfPassword.text?.count != 0 ? true : false
        default:
            PhoneNoView.addBottomShadow(shadowDepth: 0.5)
            PasswordView.addBottomShadow(shadowDepth: 0.5)
        }
        self.checkLoginData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
