//
//  CustomTextField.swift
//  mApp
//
//  Created by Dayana Marden on 15.06.17.
//  Copyright © 2017 Dayana Marden. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class CustomTextFields : SkyFloatingLabelTextField{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 200, height: 45)
        self.title = ""
        self.textColor = .lightPink
        self.font = UIFont(name: "Neucha", size: 20)
        self.textAlignment = .center
        self.tintColor = .lightPink
        self.lineHeight = 0.5
        self.lineColor = .lightGray
        self.selectedLineColor = .lightPink
        self.selectedLineHeight = 0.5
        self.autocapitalizationType = .none

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
