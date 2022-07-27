//
//  ViewController.swift
//  TurkishKitchen
//
//  Created by macbook on 4/11/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var ovqatlar = [Ovqat]()
    let tableView = UITableView()
    let customView = NavigationView()
    let topView = UIView()
    let optionsView = UIView()
    let optionsTableView = UITableView()
    var isSelectedStar = false
    var isSelected = false
    var selectedArr = [Int]()
    var defaults = UserDefaults.standard
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 43/255, alpha: 1)
        
        selectedArr = defaults.array(forKey: "select") as? [Int] ?? [Int]()
        

        parseJSON()
        
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .darkGray
        customView.nameLabel.text = "Меню Турецкой кухни"
        customView.optionsBtn.addTarget(self, action: #selector(btnClicked(_ :)), for: .touchUpInside)
        customView.optionsBtn.tag = 300
        customView.rightBtn.isHidden = true
        
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .darkGray
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 43/255, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PictureCell.self, forCellReuseIdentifier: "PictureCell")
        
        view.addSubview(optionsView)
        optionsView.translatesAutoresizingMaskIntoConstraints = false
        optionsView.backgroundColor = .cyan
        optionsView.isHidden = true
        
        optionsView.addSubview(optionsTableView)
        optionsTableView.translatesAutoresizingMaskIntoConstraints = false
        optionsTableView.backgroundColor = .white
        optionsTableView.delegate = self
        optionsTableView.dataSource = self
        optionsTableView.separatorStyle = .none
        optionsTableView.register(BasicCell.self, forCellReuseIdentifier: "BasicCell")
        
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
            
            optionsView.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: -10),
            optionsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            optionsView.heightAnchor.constraint(equalToConstant: 40),
            optionsView.widthAnchor.constraint(equalToConstant: 150),
            
            optionsTableView.topAnchor.constraint(equalTo: optionsView.topAnchor),
            optionsTableView.leftAnchor.constraint(equalTo: optionsView.leftAnchor),
            optionsTableView.rightAnchor.constraint(equalTo: optionsView.rightAnchor),
            optionsTableView.bottomAnchor.constraint(equalTo: optionsView.bottomAnchor),
            
            ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        selectedArr = defaults.array(forKey: "select") as? [Int] ?? [Int]()
        tableView.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    @objc func btnClicked(_ sender: UIButton){
    
 
        if sender.tag == 200 {
            let vc = CollectionViewController()
            vc.ovqatlar = ovqatlar
            vc.selectArr = defaults.array(forKey: "select") as? [Int] ?? [Int]()
            optionsView.isHidden = true
            isSelected = false
            navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 300 {
            if isSelected == false {
                optionsView.isHidden = false
            }
            
            if isSelected == true {
                optionsView.isHidden = true
            }
            
            isSelected = !isSelected
        }
        
    }
    
    @objc func starClicked(_ sender: UIButton){
        
        if selectedArr.contains(where: {$0 == sender.tag}) == false {
            selectedArr.append(sender.tag)
            defaults.set(selectedArr, forKey: "select")
            defaults.synchronize()
            optionsView.isHidden = true
            isSelected = false
            sender.setImage(UIImage(named: "star gold")?.withRenderingMode(.alwaysOriginal), for: .normal)
            
        } else {
            selectedArr = selectedArr.filter{$0 != sender.tag}
            defaults.set(selectedArr, forKey: "select")
            defaults.synchronize()
            optionsView.isHidden = true
            isSelected = false
            sender.setImage(UIImage(named: "star empty"), for: .normal)
        }
        
    }


    func parseJSON() {
        
        guard let path = Bundle.main.path(forResource: "turk_cuisine", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url) {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]] {
                    var arr = [Ovqat]()
                    for item in json {
                        
                        let obj = Ovqat(item)
                        arr.append(obj)
                    }
                    ovqatlar = arr
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == optionsTableView {
            return 1
        }
        return ovqatlar.count
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        if tableView == optionsTableView {
            let cell = optionsTableView.dequeueReusableCell(withIdentifier: "BasicCell") as! BasicCell
//            if indexPath.row == 0 {
//                cell.icon.image = UIImage(named: "settings")
//                cell.label.text = "Настройки"
//            }
            if indexPath.row == 0 {
                cell.icon.image = UIImage(named: "star gold")
                cell.label.text = "Избранные"
                cell.selectedBtn.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
                cell.selectedBtn.tag = 200
            }
//            if indexPath.row == 2 {
//                cell.icon.image = UIImage(named: "search")
//                cell.label.text = "Поиск"
//            }
            
  
            return cell
        }
        
        if tableView == tableView {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell") as! PictureCell
            
                if let url = URL(string: "\(ovqatlar[indexPath.row].img_url ?? "")"){
                    if let data = try? Data(contentsOf: url) {
                        cell.myImage.image = UIImage(data: data)
                    }
                } else {
                    cell.myImage.heightAnchor.constraint(equalToConstant: 0).isActive = true
                }
//            }
           
            if (defaults.array(forKey: "select") as? [Int] ?? [Int]()).contains(where: {$0 == indexPath.row}) == false {
                cell.starBtn.setImage(UIImage(named: "star empty"), for: .normal)
                
            } else {
                cell.starBtn.setImage(UIImage(named: "star gold")?.withRenderingMode(.alwaysOriginal), for: .normal)
            }

       
        cell.starBtn.addTarget(self, action: #selector(starClicked(_:)), for: .touchUpInside)
        cell.starBtn.tag = indexPath.row
            
        cell.label.text = "\(indexPath.row+1). \(ovqatlar[indexPath.row].name ?? "")"
        cell.label2.text = "\(ovqatlar[indexPath.row].desc ?? "")"

        return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell") as! PictureCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableView {
            let vc = IngredientsController()
            vc.ovqat = ovqatlar[indexPath.row]
            optionsView.isHidden = true
            isSelected = false
            navigationController?.pushViewController(vc, animated: true)
        }
        

    }
    
    
    
}
