//
//  SelectedViewController.swift
//  TurkishKitchen
//
//  Created by macbook on 4/15/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit


class SelectedViewController: UIViewController {
    
    let customView = NavigationView()
    let topView = UIView()
    let tableView = UITableView()
    
    var foods = [Ovqat]()
    var selectArr = [Int]()
    var defaults = UserDefaults.standard
 
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
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 43/255, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PictureCell.self, forCellReuseIdentifier: "PictureCell")
        
        NSLayoutConstraint.activate([
            
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customView.leftAnchor.constraint(equalTo: view.leftAnchor),
            customView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leftAnchor.constraint(equalTo: view.leftAnchor),
            topView.rightAnchor.constraint(equalTo: view.rightAnchor),
            topView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tableView.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            ])
        
    }
    
    @objc func btnClicked(_ sender: UIButton){
        
        navigationController?.popViewController(animated: true)
        
    }
 
    @objc func starBtnClicked(_ sender: UIButton){
        if selectArr.contains(where: {$0 == sender.tag}) == false {
            selectArr.append(sender.tag)
            defaults.set(selectArr,forKey: "select")
            sender.setImage(UIImage(named: "star gold"), for: .normal)
        } else {
            selectArr = selectArr.filter{$0 != sender.tag}
            defaults.set(selectArr,forKey: "select")
            sender.setImage(UIImage(named: "star empty"), for: .normal)
        }
        tableView.reloadData()
    }
    
    @objc func removeClicked(_ sender: UIButton) {
        if selectArr.contains(where: {$0 == sender.tag}) == true {
            selectArr.removeAll()
            defaults.set(selectArr,forKey: "select")
        }

        tableView.reloadData()
    }
}

extension SelectedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return selectArr.count
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = selectArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell") as! PictureCell
        
        if let url = URL(string: "\(foods[index].img_url ?? "")"){
            if let data = try? Data(contentsOf: url) {
                cell.myImage.image = UIImage(data: data)
            }
        } else {
            cell.myImage.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
 
            cell.starBtn.setImage(UIImage(named: "star gold")?.withRenderingMode(.alwaysOriginal), for: .normal)
 
        cell.starBtn.tag = index
        cell.starBtn.addTarget(self, action: #selector(starBtnClicked(_:)), for: .touchUpInside)
        
        cell.label.text = "\(indexPath.row+1). \(foods[index].name ?? "")"
        cell.label2.text = "\(foods[index].desc ?? "")"
        
        return cell
    }
  
}
