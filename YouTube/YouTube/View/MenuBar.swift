//
//  MenuBar.swift
//  YouTube
//
//  Created by Deepak Kumar on 28/10/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var cellID = "menuItem"
    var menuOptions = ["home", "trending", "subscriptions", "account"]
    var sliderViewLeftConstraints: NSLayoutConstraint?
    
    lazy var menuCollection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let menus = UICollectionView(frame: .zero, collectionViewLayout: layout)
        menus.translatesAutoresizingMaskIntoConstraints = false
        menus.dataSource = self
        menus.delegate = self
        return menus
    }()
    
    var slideView: UIView = {
       var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        menuCollection.register(menuCell.self, forCellWithReuseIdentifier: cellID)
        menuCollection.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        let selectedIndex = IndexPath(item: 0, section: 0)
        menuCollection.selectItem(at: selectedIndex, animated: false, scrollPosition: [])
        setupViews()
    }
    
    
    func setupViews(){
        
        addSubview(menuCollection)
        addSubview(slideView)
        
        slideView.translatesAutoresizingMaskIntoConstraints = false
        slideView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        slideView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        sliderViewLeftConstraints = slideView.leftAnchor.constraint(equalTo: self.leftAnchor)
        sliderViewLeftConstraints!.isActive = true
        slideView.bottomAnchor.constraint(equalTo: self.menuCollection.bottomAnchor).isActive = true
        
        addConstraintWithVisualFormat(format: "H:|[v0]|", views: menuCollection)
        addConstraintWithVisualFormat(format: "V:|[v0(50)]", views: menuCollection)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! menuCell
        cell.menuImage.image = UIImage(named: menuOptions[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.item
        let x = CGFloat(integerLiteral: row)*self.frame.width/4
        print("row: \(row)")
        sliderViewLeftConstraints?.constant = x
        sliderViewLeftConstraints?.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}




class menuCell: BaseCell{
    
    var menuImage: UIImageView = {
        let menu = UIImageView()
        menu.image = UIImage(named: "profile")
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
    }()
    
    override var isHighlighted: Bool{
        didSet{
            menuImage.tintColor = isHighlighted ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool{
        didSet{
            menuImage.tintColor = isSelected ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : UIColor.rgb(red: 91, green: 14, blue: 13)
            
        }
    }
    
    override func setupViews() {
        addSubview(menuImage)
        
        addConstraintWithVisualFormat(format: "H:[v0(28)]", views: menuImage)
        addConstraintWithVisualFormat(format: "V:[v0(28)]", views: menuImage)
        
        addConstraint(NSLayoutConstraint(item: menuImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: menuImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
