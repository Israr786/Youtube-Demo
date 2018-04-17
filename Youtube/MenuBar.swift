//
//  MenuBar.swift
//  Youtube
//
//  Created by Apple on 4/11/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class BaseCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
    }
    
    func setupViews(){
        
    }
        
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


class  MenuBar :UIView ,UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    lazy var collectionView : UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = UIColor.rbg(red: 230, green: 32, blue: 32)
 
        return cv
        
    }()
    
  
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    let cellID = "cellID"
    let imagesName = ["home","instagram","setting","home"]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:cellID , for: indexPath) as! MenusCell
        
        cell.imageView.image = UIImage(named:imagesName[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rbg(red:0, green: 0  , blue: 0)
     //   cell.backgroundColor = UIColor.blue

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame:frame)
        collectionView.register(MenusCell.self, forCellWithReuseIdentifier: cellID)
        addSubview(collectionView)
        addConstraintWithFormat(format:"H:|[v0]|", view: collectionView)
        addConstraintWithFormat(format:"V:|[v0]|", view: collectionView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenusCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    let imageView :UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"home")?.withRenderingMode(.alwaysOriginal)
     return iv
    }()
    
 
    override var isHighlighted: Bool{
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rbg(red: 0, green: 0 , blue: 0)
        }
        
    }
    override var isSelected: Bool{
        didSet{
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rbg(red: 0, green: 0, blue: 0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        backgroundColor = UIColor.rbg(red: 230, green: 32, blue: 32)
        addSubview(imageView)
        addConstraintWithFormat(format:"H:|-28-[v0(28)]-28-|", view: imageView)
        addConstraintWithFormat(format:"V:|-5-[v0(28)]-5-|", view: imageView)
    //    addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
   //     addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
        
    }
    
    
}



