//
//  CollectionView.swift
//  TurkishKitchen
//
//  Created by macbook on 5/6/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    let customView = NavigationView()
    let topView = UIView()
    var ovqatlar = [Ovqat]()
    var selectArr = [Int]()
    var defaults = UserDefaults.standard

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 190, height: 170)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectArr = defaults.array(forKey: "select") as? [Int] ?? [Int]()
        
        view.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 43/255, alpha: 1)
        
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .darkGray
        customView.nameLabel.text = "Избранные"
        customView.optionsBtn.setImage(UIImage(named: "left arrow"), for: .normal)
        customView.optionsBtn.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        customView.rightBtn.addTarget(self, action: #selector(removeClicked(_:)), for: .touchUpInside)
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .darkGray
        
       
        view.addSubview(collectionView)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customView.leftAnchor.constraint(equalTo: view.leftAnchor),
            customView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leftAnchor.constraint(equalTo: view.leftAnchor),
            topView.rightAnchor.constraint(equalTo: view.rightAnchor),
            topView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            collectionView.topAnchor.constraint(equalTo: customView.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func btnClicked(_ sender: UIButton){
        
        navigationController?.popViewController(animated: true)
        
    }
    @objc func starBtnClicked(_ sender: UIButton){
        if selectArr.contains(where: {$0 == sender.tag}) == false {
            selectArr.append(sender.tag)
            defaults.set(selectArr,forKey: "select")
            sender.setImage(UIImage(named: "star gold")?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            selectArr = selectArr.filter{$0 != sender.tag}
            defaults.set(selectArr,forKey: "select")
            sender.setImage(UIImage(named: "star empty")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        collectionView.reloadData()
    }
    @objc func removeClicked(_ sender: UIButton) {
            selectArr.removeAll()
            defaults.set(selectArr,forKey: "select")
        
        collectionView.reloadData()
    }
    
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

        if let url = URL(string: "\(ovqatlar[selectArr[indexPath.item]].img_url ?? "")"){
            if let data = try? Data(contentsOf: url) {
                cell.imageView.image = UIImage(data: data)
            }
        }
        
        cell.starBtn.tag = selectArr[indexPath.item]
        cell.starBtn.setImage(UIImage(named: "star gold")?.withRenderingMode(.alwaysOriginal), for: .normal)
        cell.starBtn.addTarget(self, action: #selector(starBtnClicked), for: .touchUpInside)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let wd = UIScreen.main.bounds.width
        let width = (wd - 3 * 15)/2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = IngredientsController()
        vc.ovqat = ovqatlar[selectArr[indexPath.item]]
        navigationController?.pushViewController(vc, animated: true)
    }
    
   
    
}
