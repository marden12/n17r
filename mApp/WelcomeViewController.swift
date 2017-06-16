//
//  WelcomeViewController.swift
//  mApp
//
//  Created by Dayana Marden on 13.06.17.
//  Copyright © 2017 Dayana Marden. All rights reserved.
//

import UIKit
import Cartography

class WelcomeViewController: UIViewController {
    let screen = UIScreen.main.bounds
    var iconImageView = UIImageView()
    fileprivate lazy var labelImage : UIImageView = {
        let my_image = UIImage(named: "mainLabel")
        let my_imageView = UIImageView(image: my_image)
        return my_imageView
    }()
    fileprivate lazy var mainView : UIView = {
        let mainV = UIView()
        mainV.backgroundColor = .clear
        return mainV
    }()
    fileprivate lazy var registrationButton : CustomButton = {
        let button = CustomButton()
        button.setImage(#imageLiteral(resourceName: "Registration"), for: .normal)
        button.backgroundColor = .darkBlue
        button.myTitleLabel.text = "Регистрация"
        button.addTarget(self, action: #selector(navigateToRegistration(_:)), for: .touchUpInside)
        return button
    
    }()
    fileprivate lazy var loginButton : CustomButton = {
        let button = CustomButton()
        button.setImage(#imageLiteral(resourceName: "Login"), for: .normal)
        button.myTitleLabel.text = "Войти"
        button.addTarget(self, action: #selector(navigateToLogin(_:)), for: .touchUpInside)
        button.backgroundColor = .lightPink
        return button
    }()
    fileprivate lazy var scoreButton : CustomButton = {
        let button = CustomButton()
        button.setImage(#imageLiteral(resourceName: "ScoreBoard"), for: .normal)
        button.myTitleLabel.text = "Рейтинг"
        button.backgroundColor = .darkBlue
        return button
    }()
    fileprivate lazy var aboutButton : CustomButton = {
        let button = CustomButton()
        button.setImage(#imageLiteral(resourceName: "About"), for: .normal)
        button.myTitleLabel.text = "О нас"
        button.backgroundColor = .darkBlue
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
    }
    
    func setupViews(){
        view.addSubview(mainView)
        view.addSubview(labelImage)
        view.addSubview(loginButton)
        view.addSubview(scoreButton)
        view.addSubview(aboutButton)
        view.addSubview(registrationButton)
    }
    
    private func setupConstrains() {
        constrain(labelImage,view){ labelImage,v in
            labelImage.top == v.top + 25
            labelImage.width == 209
            labelImage.height == 185
            labelImage.centerX == v.centerX
        }
        constrain(registrationButton,loginButton,mainView,scoreButton,aboutButton){ regBtn,loginBtn,mainV,scoreBtn,aboutBtn in
            //reg
            regBtn.width == 150
            regBtn.height == 150
            regBtn.top == mainV.top + 10
            regBtn.left == mainV.left + 10
            //login
            loginBtn.width == 150
            loginBtn.height == 150
            loginBtn.right == mainV.right - 10
            loginBtn.top ==  mainV.top + 10
            //score
            scoreBtn.width == 150
            scoreBtn.height == 150
            scoreBtn.bottom == mainV.bottom - 10
            scoreBtn.left == mainV.left + 10
            //about
            aboutBtn.width == 150
            aboutBtn.height == 150
            aboutBtn.right == mainV.right - 10
            aboutBtn.bottom ==  mainV.bottom - 10
        }
        constrain(mainView,view,labelImage){ mainView,v,labelImage in
            mainView.width == 340
            mainView.height == 340
            mainView.centerX == v.centerX
            mainView.top == labelImage.bottom + 25
        }
    }
    
    func navigateToLogin(_ sender:UIButton){
        let newViewController = LoginViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    func navigateToRegistration(_ sender:UIButton){
        let newViewController = RegistrationViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    func navigateToAbout(_ sender:UIButton){
        let newViewController = LoginViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    func navigateToScore(_ sender:UIButton){
        let newViewController = LoginViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }

    
}
