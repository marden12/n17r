//
//  CustomButtons.swift
//  mApp
//
//  Created by Dayana Marden on 14.06.17.
//  Copyright © 2017 Dayana Marden. All rights reserved.
//

import UIKit
import Cartography
class CustomButton : UIButton {

    let myTitleLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        self.layer.cornerRadius = 29
        self.imageEdgeInsets = UIEdgeInsetsMake(52, 52, 52, 52)
        self.sizeToFit()
        myTitleLabel.font = UIFont(name: "Neucha", size: 24)
        myTitleLabel.textColor = .white
        self.addSubview(myTitleLabel)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     
    }
    func setupConstraints() {
        constrain(myTitleLabel,self){ l, s   in
            l.centerX == s.centerX
            l.bottom == s.bottom - 10
        }
    }

    
}
