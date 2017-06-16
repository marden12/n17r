//
//  LoginViewController.swift
//  mApp
//
//  Created by Dayana Marden on 12.06.17.
//  Copyright © 2017 Dayana Marden. All rights reserved.
//

import UIKit
import Cartography
import SkyFloatingLabelTextField
class LoginViewController: UIViewController {
    
    fileprivate lazy var backgroundView : UIView = {
        let mView = UIView()
        mView.backgroundColor = .darkBlue
        mView.layer.cornerRadius = 29
        return mView
    }()
    fileprivate lazy var emailTextField : CustomTextFields = {
        let textField = CustomTextFields()
        textField.placeholder = "Введите свой email"
        return textField
    }()
    fileprivate lazy var passwordTextField : CustomTextFields = {
        let textField = CustomTextFields()
        textField.placeholder = "Введите свой пороль"
        textField.isSecureTextEntry = true
        return textField
    }()
    fileprivate lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "nextPAge"), for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setupViews()
        setupConstrains()
    }
    func setupViews(){
        backgroundView.addSubview(emailTextField)
        backgroundView.addSubview(passwordTextField)
        backgroundView.addSubview(nextButton)
        view.addSubview(backgroundView)
    }
    private func setupConstrains(){
        constrain(backgroundView,view,emailTextField,passwordTextField,nextButton){ bV,v,eTF,pTF,nBtn in
            bV.left == v.left + 20
            bV.right == v.right - 20
            bV.top == v.top + 40
            bV.bottom == v.bottom - 40
            eTF.center == v.center
            pTF.top == eTF.bottom + 10
            pTF.centerX == v.centerX
            nBtn.width == 40
            nBtn.height == 40
            nBtn.top == pTF.bottom + 60
            nBtn.centerX == v.centerX
        }
    }
    
}
