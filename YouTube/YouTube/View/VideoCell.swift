//
//  VideoCell.swift
//  YouTube
//
//  Created by Deepak Kumar on 27/10/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews(){
        
    }
}

class videoCell: BaseCell{
    
    let thumbnailImage: UIImageView = {
        let image = UIImageView()
        //        image.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "thumbnail")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let sepratorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        //        image.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "profile")
        image.layer.cornerRadius = 22
        image.layer.masksToBounds = true
        return image
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Yenti Yenti - Geetha Govindam - this extra line should make the textview wrap"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Lovely Song from Geetha Govindam - this extra line should make the textview wrap"
        textView.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        textView.contentInset = UIEdgeInsets(top: -8, left: 0, bottom: 0, right: 0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func setupViews(){
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubview(thumbnailImage)
        addSubview(profileImage)
        addSubview(sepratorView)
        addSubview(title)
        addSubview(subtitleTextView)
        
        addConstraintWithVisualFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImage)
        addConstraintWithVisualFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImage, profileImage, sepratorView)
        addConstraintWithVisualFormat(format: "H:|-16-[v0(44)]", views: profileImage)
        addConstraintWithVisualFormat(format: "H:|[v0]|", views: sepratorView)
        
        // Top constraints for title
        addConstraint(NSLayoutConstraint(item: title, attribute: .top, relatedBy: .equal, toItem: thumbnailImage, attribute: .bottom, multiplier: 1, constant: 8))
        // left conctraints
        addConstraint(NSLayoutConstraint(item: title, attribute: .left, relatedBy: .equal, toItem: profileImage, attribute: .right, multiplier: 1, constant: 8))
        // height constraints
        addConstraint(NSLayoutConstraint(item: title, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        // Right constraints
        addConstraint(NSLayoutConstraint(item: title, attribute: .right, relatedBy: .equal, toItem: thumbnailImage, attribute: .right, multiplier: 1, constant: 0))
        
        
        // Top constraints for subTitleTextView
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 4))
        // left conctraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: profileImage, attribute: .right, multiplier: 1, constant: 8))
        // height constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        // Right constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImage, attribute: .right, multiplier: 1, constant: 0))
    }
}
