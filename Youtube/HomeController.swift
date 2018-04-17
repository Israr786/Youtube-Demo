//
//  ViewController.swift
//  Youtube
//
//  Created by Apple on 4/5/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit


class HomeViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    
    var videos : [Video] = {
        
        var blankspaceVideo = Video()
        blankspaceVideo.title = "Ed SheeranVevo - Holding long"
        blankspaceVideo.thumbnailImageName = "image_ed"
        
        var badBloodVideo = Video()
        badBloodVideo.title = "Ed SheeranVevo - Blank Space"
        badBloodVideo.thumbnailImageName = "ed_pic2"
       
        return [blankspaceVideo,badBloodVideo]
    
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
      navigationController?.navigationBar.isTranslucent=false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backIndicatorImage = UIImage()
        
   
        // Do any additional setup after loading the view, typically from a nib.
        
        let titlelabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
        titlelabel.text = "Home"
        titlelabel.textColor = UIColor.white
        titlelabel.font = UIFont.systemFont(ofSize: 20)
        
        navigationItem.titleView = titlelabel
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier:"cellId")
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0 )
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setupMenuBar()
   //     setupNavBarButtons()
        
    }
    
    func setupNavBarButtons(){
        let searchImage = UIImage(named:"search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style:.plain, target: self, action: #selector(handleSearch))
        let moreButton = UIImage(named:"more")?.withRenderingMode(.alwaysTemplate)
        let moreBarButtonItem = UIBarButtonItem(image: moreButton, style: .plain, target: self, action: #selector(handleMoreButton))
        
        navigationItem.rightBarButtonItems = [searchBarButtonItem]
    }
    @objc func handleSearch(){
        
        print(123)
        
        
    }
    
    @objc func handleMoreButton(){
        print(456)
        
    }
    
    let menuBar : MenuBar = {
        
        let mb = MenuBar()
        return mb
     
    }()
    
    private func setupMenuBar() {
    
    view.addSubview(menuBar)
        menuBar.backgroundColor = UIColor.rbg(red: 230, green: 32, blue: 32)
        view.addConstraintWithFormat(format:"H:|[v0]|", view: menuBar)
        view.addConstraintWithFormat(format:"V:|[v0(50)]|", view: menuBar)

    }
    
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cellId", for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
         
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width-16-16) * 9/16
        return CGSize(width: view.frame.width, height: height+16+68)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





