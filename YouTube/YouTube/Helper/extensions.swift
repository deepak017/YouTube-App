//
//  extensions.swift
//  YouTube
//
//  Created by Deepak Kumar on 27/10/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit

extension UIColor{
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat)->UIColor{
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}



extension UIView{
    
    func addConstraintWithVisualFormat(format: String, views: UIView...){
        var viewDictionary = [String:UIView]()
        
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: viewDictionary))
    }
}
