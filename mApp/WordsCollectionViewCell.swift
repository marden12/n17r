//
//  WordsCell.swift
//  mApp
//
//  Created by Dayana Marden on 08.06.17.
//  Copyright © 2017 Dayana Marden. All rights reserved.
//

import UIKit

class WordsCollectionViewCell: UICollectionViewCell {
    
    public lazy var wordsLabels : UILabel = {
        let word = UILabel()
        word.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        word.textColor = .backgroundColor
        return word
    
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightPink
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(wordsLabels)
    }
}
