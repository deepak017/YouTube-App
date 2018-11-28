//
//  bottomSheetCell.swift
//  YouTube
//
//  Created by Deepak Kumar on 07/11/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit

class bottomSheetCell: BaseCell{
    
    var label: UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont(name: label.font.fontName, size: 25)
        return label
    }()
    
    var icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(label)
        addSubview(icon)
        label.translatesAutoresizingMaskIntoConstraints = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintWithVisualFormat(format: "H:|-16-[v0(40)]-8-[v1]|", views: icon, label)
        addConstraintWithVisualFormat(format: "V:|-12-[v0]", views: label)
        addConstraintWithVisualFormat(format: "V:|-8-[v0(40)]", views: icon)
    }
}
