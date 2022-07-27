//
//  IngredientsController.swift
//  TurkishKitchen
//
//  Created by macbook on 4/12/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class IngredientsController: UIViewController {
    
    let customView = NavigationView()
    let topView = UIView()
    let tableView = UITableView()
 
    var ovqat: Ovqat?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 43/255, alpha: 1)
        
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .darkGray
        customView.optionsBtn.setImage(UIImage(named: "left arrow"), for: .normal)
        customView.optionsBtn.addTarget(self, action: #selector(backClicked(_:)), for: .touchUpInside)
        customView.rightBtn.isHidden = true
        customView.nameLabel.text = ovqat?.name ?? ""
        
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .darkGray
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 43/255, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "Header")
        tableView.register(IngredientListCell.self, forCellReuseIdentifier: "IngredientListCell")
        tableView.register(ImageCell.self, forCellReuseIdentifier: "ImageCell")
        
        
        NSLayoutConstraint.activate([
            
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customView.leftAnchor.constraint(equalTo: view.leftAnchor),
            customView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leftAnchor.constraint(equalTo: view.leftAnchor),
            topView.rightAnchor.constraint(equalTo: view.rightAnchor),
            topView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tableView.topAnchor.constraint(equalTo: customView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            ])
    }
    
    @objc func backClicked(_ sender: UIButton){
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

}

extension IngredientsController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! Header
        if section == 0 {
            headerView.headerLabel.text = "О блюде"
        }
        if section == 1 {
            headerView.headerLabel.text = "Ингредиенты"
        }
        if section == 2 {
            headerView.headerLabel.text = "Шаги"
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return ovqat?.ingredients.count ?? 0
        }
        if section == 2 {
            tableView.separatorStyle = .none
            return ovqat?.steps.count ?? 0
        }
        return 1
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
            if let url = URL(string: "\(ovqat?.img_url ?? "")") {
                if let data = try? Data(contentsOf: url) {
                    cell.myImage.image = UIImage(data: data)
                }
            }
            
            
            cell.label.text = ovqat?.desc ?? ""
            cell.selectionStyle = .none
            cell.label.textColor = .cyan
            return cell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientListCell") as! IngredientListCell
            cell.label.text = "\(indexPath.row+1). \(ovqat?.ingredients[indexPath.row].name ?? "")"
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
        cell.label.text = "\(indexPath.row+1).  \(ovqat?.steps[indexPath.row].name ?? "")"
        cell.label.textColor = UIColor(red: 230/255, green: 195/255, blue: 85/255, alpha: 1)
        if let url = URL(string: "\(ovqat?.steps[indexPath.row].img ?? "")") {
            if let data = try? Data(contentsOf: url) {
                cell.myImage.image = UIImage(data: data)
            }
        } else {
            cell.myImage.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
        cell.selectionStyle = .none
        return cell
}
}
