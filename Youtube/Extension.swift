//
//  Extension.swift
//  Youtube
//
//  Created by Apple on 4/11/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
extension UIView{
    func addConstraintWithFormat (format : String , view:UIView...){
        
        var viewDictionary=[String:UIView]()
        for (index,view) in view.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
}


extension UIColor {
    static func rbg(red:CGFloat,  green:CGFloat, blue: CGFloat)->UIColor{
    return UIColor(displayP3Red: red/255, green: green/255, blue:blue/255, alpha: 1)
    }
}
