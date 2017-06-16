//
//  MenuViewController.swift
//  mApp
//
//  Created by Dayana Marden on 16.06.17.
//  Copyright © 2017 Dayana Marden. All rights reserved.
//

import UIKit
import Cartography
class MenuViewController: UIViewController {
    fileprivate lazy var singleGameButton : CustomButton = {
        let button = CustomButton()
        button.setImage(#imageLiteral(resourceName: "singleGame"), for: .normal)
        button.myTitleLabel.text = "Одиночная игра"
        button.backgroundColor = .darkBlue
        //button.addTarget(self, action: #selector(singlGameBtn(_:)), for: .touchUpInside)
        return button
    }()
    fileprivate lazy var multipleGameButton : CustomButton = {
        let button = CustomButton()
        button.myTitleLabel.text = "Устроить дуэль"
        button.backgroundColor = .lightPink
        button.setImage(#imageLiteral(resourceName: "MutipleGame"), for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setupViews()
        setupConstrains()
    }
    func setupViews(){
        view.addSubview(singleGameButton)
        view.addSubview(multipleGameButton)
    }
    
    func setupConstrains(){
        constrain(singleGameButton,multipleGameButton,view){s,m,v in
            s.width == 180
            s.height == 180
            m.width == 180
            m.height == 180
            s.left == v.left + 5
            s.centerY == v.centerY
            m.right == v.right - 5
            m.centerY == v.centerY

        }
    }
    func singlGameBtn(_sender:UIButton){
        
    }
}
