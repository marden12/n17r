//
//  ViewController.swift
//  mApp
//
//  Created by Dayana Marden on 07.06.17.
//  Copyright © 2017 Dayana Marden. All rights reserved.
//

import UIKit
import Cartography
import SwiftyJSON
import Alamofire
import ObjectMapper

class StartViewController: UIViewController{
    
    let screen = UIScreen.main.bounds
    var wordsArray : [String] = []
    var numberOfSection = 0
    
    fileprivate lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColor
        view.frame = CGRect(x: 0, y: 20, width: self.screen.width, height: self.screen.height)
        return view
    }()
    
    fileprivate lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColor
        view.frame = CGRect(x: self.screen.width, y: 20, width: self.screen.width + 20 , height: self.screen.height)
        return view
    }()
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width:2 * self.screen.width , height: 200)
        scrollView.backgroundColor = .backgroundColor
        return scrollView
    }()
    
    fileprivate lazy var questionLabel : UILabel  = {
        let label = UILabel()
        label.text = "What is your name?"
        label.textColor = .white
        label.backgroundColor = .darkBlue
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = UIFont(name: "Neucha", size: 20)
        label.layer.cornerRadius = 29
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.clear.cgColor
        label.layer.masksToBounds = true
        return label
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.backgroundColor = .backgroundColor
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WordsCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        return collectionView
    }()
    
    fileprivate lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        var width = (self.view.frame.size.width - 12 * 3) / 3 //some width
        var height = width * 1.5 //ratio
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 10
        
        layout.scrollDirection = .horizontal
        return layout
    }()
    fileprivate lazy var answerTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .lightBlue
        textField.layer.cornerRadius = 12
        textField.autocorrectionType = .no
        textField.isEnabled = true
        return textField
    
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try parseJson()
        }
        catch{
            print("Erorr occured")
        }
        setupView()
        setupConstrains()
    }
    override func viewDidAppear(_ animated: Bool) {
        answerTextField.becomeFirstResponder()
    }
    
    func setupView(){
        view.addSubview(scrollView)
        view.addSubview(answerTextField)
        scrollView.addSubview(firstView)
        scrollView.addSubview(secondView)
        firstView.addSubview(questionLabel)
        secondView.addSubview(collectionView)
    }
 
    func parseJson() throws{
        
        guard let path = Bundle.main.path(forResource: "JsonFile", ofType: "json") else {
            throw Error()
        }
        let fileUrl = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: fileUrl, options: .alwaysMapped)
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]
        
        guard let objects = json["questions"] as? [[String:Any]] else {
            throw Error()
        }
        
        if let questions = Mapper<Question>().mapArray(JSONArray: objects) {
            
            for question in questions {
                print(question.level)
                print(question.text)

                print(question.words)

            }
            
        }
        
        
        
        
        print()
    }
    
    private func setupConstrains() {
        constrain(scrollView, view, firstView, questionLabel,answerTextField){ scroll,v, firstView, label, textField  in
            scroll.top == v.top
            scroll.left == v.left
            scroll.right == v.right
            scroll.bottom == v.bottom - 216
            label.center == scroll.center
            label.width == 177
            label.height == 177
            textField.bottom == v.bottom - 216
            textField.width == firstView.width
            textField.height == 40
        }

        constrain(secondView, collectionView) {
            $1.width == $0.width
            $1.height == $0.height/2
            $1.centerX == $0.centerX
            $1.top == $0.top
        }
    }
}

extension StartViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! WordsCollectionViewCell
        //cell.wordsLabels.text = wordsArray[indexPath.row]
        return cell
        
    }
}


