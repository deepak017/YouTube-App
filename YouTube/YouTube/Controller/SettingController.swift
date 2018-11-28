//
//  SettingController.swift
//  YouTube
//
//  Created by Deepak Kumar on 31/10/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit

class settingsLauncher:NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var MenuOptionsLabel = ["Settings","Switch Account","Privacy","Feedback","Help"]
    var menuOptionsIcon = ["settings","switch_account", "privacy","feedback","help"]
    
    var cellID = "menuCell"
    var variable = ""
    
    var overlay = UIView()
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cv
    }()
    
    func showSettings(view: UIView){

        collectionView.dataSource = self
        collectionView.delegate = self
        if let window = UIApplication.shared.keyWindow{
            overlay.frame = window.frame
            overlay.backgroundColor = UIColor(white: 0, alpha: 0.5)
            overlay.alpha = 0
            
            let height = window.frame.height/2
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height/2)
            collectionView.register(bottomSheetCell.self, forCellWithReuseIdentifier: cellID)
            
            window.addSubview(overlay)
            window.addSubview(collectionView)
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.overlay.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }, completion: nil)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissOverlay))
        overlay.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissOverlay(){

        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.overlay.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MenuOptionsLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! bottomSheetCell
        cell.label.text = MenuOptionsLabel[indexPath.row]
        cell.icon.image = UIImage(named: menuOptionsIcon[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
