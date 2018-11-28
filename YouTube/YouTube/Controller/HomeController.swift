//
//  ViewController.swift
//  YouTube
//
//  Created by Deepak Kumar on 25/10/18.
//  Copyright © 2018 Deepak Kumar. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loadVideos()
        
        navigationController?.navigationBar.isTranslucent = false
        
        let headerTitle = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
        headerTitle.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headerTitle.text = "Home"
        headerTitle.font = UIFont(name: headerTitle.font.fontName, size: 20)
        
        navigationItem.titleView = headerTitle
        
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.register(videoCell.self, forCellWithReuseIdentifier: "videoCell")
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        setupMenuBar()
        setupNavBarButtons()
    }
    
    func loadVideos(){
        print("inside loadvideos")
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil{
                print("123\(error!)")
                return
            }
            let dataString = String(data: data!, encoding: .utf8)
//            print(dataString!)
            //print(response!)
        }
        task.resume()
    }
    
    var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    private func setupMenuBar(){
        navigationController?.hidesBarsOnSwipe = true
        
        let redView = UIView()
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraintWithVisualFormat(format: "H:|[v0]|", views: redView)
        view.addConstraintWithVisualFormat(format: "V:[v0(50)]", views: redView)
        
        view.addSubview(menuBar)
        
        view.addConstraintWithVisualFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintWithVisualFormat(format: "V:[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }

    func setupNavBarButtons(){
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearchClick))
        let moreOptionsImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreOptionsButton = UIBarButtonItem(image: moreOptionsImage, style: .plain, target: self, action: #selector(handleOptionsClick))
        navigationItem.rightBarButtonItems = [moreOptionsButton, searchButton]
    }
    
    var settingsLauncherRef = settingsLauncher()
    
    @objc func handleSearchClick(){
        print(123)
    }
    
    @objc func handleOptionsClick(){
        settingsLauncherRef.showSettings(view: view)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16-16)*9/16
        return CGSize(width: view.frame.width, height: height+16+68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
