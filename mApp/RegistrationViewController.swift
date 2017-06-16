//
//  RegistrationViewController.swift
//  mApp
//
//  Created by Dayana Marden on 15.06.17.
//  Copyright © 2017 Dayana Marden. All rights reserved.
//

import UIKit
import Cartography
class RegistrationViewController: UIViewController {
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
    fileprivate lazy var nickNameTextField : CustomTextFields = {
        let textField = CustomTextFields()
        textField.placeholder = "Придумайте себе имя"
        return textField
    }()
    fileprivate lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "nextPAge"), for: .normal)
        button.addTarget(self, action: #selector(singUpBtn(_:)), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setupViews()
        setupConstrains()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupViews(){
        view.addSubview(backgroundView)
        view.addSubview(nickNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(emailTextField)
        view.addSubview(nextButton)
    }
    func setupConstrains(){
        constrain(backgroundView,view,emailTextField,passwordTextField,nickNameTextField){ bV,v,eTF,pTF,nnTF in
            bV.left == v.left + 20
            bV.right == v.right - 20
            bV.top == v.top + 40
            bV.bottom == v.bottom - 40
            eTF.center == v.center
            pTF.top == eTF.bottom + 10
            pTF.centerX == v.centerX
            nnTF.centerX == v.centerX
            nnTF.bottom == eTF.top - 10

        }
        constrain(passwordTextField,nextButton,view){ pTF,nBtn,v in
            nBtn.width == 40
            nBtn.height == 40
            nBtn.top == pTF.bottom + 60
            nBtn.centerX == v.centerX
        }
    }
    func singUpBtn(_ sender:UIButton){

    }
}
