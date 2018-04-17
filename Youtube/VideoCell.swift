//
//  VideoCell.swift
//  Youtube
//
//  Created by Apple on 4/11/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit



class VideoCell: UICollectionViewCell {
 
    var video : Video? {
        didSet{
            titleLabel.text = video?.title
            thumbnailImageView.image = UIImage(named:(video?.thumbnailImageName)!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
 
    let thumbnailImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named:"image_ed")
        theImageView.contentMode = .scaleAspectFill
        theImageView.clipsToBounds = true
        return theImageView
    }()
    
    let userProfileImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage (named:"images_profile_ed")
        theImageView.layer.cornerRadius = 22
        theImageView.layer.masksToBounds = true
        return theImageView
    }()
    
    let titleLabel:UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints=false
        textView.text = "Ed SheeranVevo - Holding long"
        return textView
        
    }()
    
    let subtitleLabel:UITextView = {
        let label = UITextView()
        label.text = "Ed SheeranVevo - 1,556,789,000 views - 2 years ago"
        label.textContainerInset=UIEdgeInsetsMake(0, -4, 0, 0 )
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
        
    }()
    
    
    let seperatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rbg(red: 230, green: 230, blue: 230)
        return view
    }()
    
    
    
    func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(seperatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        thumbnailImageView.backgroundColor = UIColor.blue
        
        addConstraintWithFormat(format:"H:|-16-[v0]-16-|", view: thumbnailImageView)
        addConstraintWithFormat(format:"V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", view:thumbnailImageView,userProfileImageView,seperatorView)
        addConstraintWithFormat(format:"H:|-16-[v0(44)]|", view: userProfileImageView)
        addConstraintWithFormat(format: "H:|[v0]|", view: seperatorView)
        
        // title
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1.0, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1.0, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //Subtitle
        
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 4))
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1.0, constant: 8))
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
        
        
        
    }
    
    
    
}
