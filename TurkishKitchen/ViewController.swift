//
//  ViewController.swift
//  TurkishKitchen
//
//  Created by macbook on 4/11/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ovqatlar = [Ovqat]()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 43/255, alpha: 1)
        
        parseJSON()
//        print(ovqatlar)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 43/255, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasicCell.self, forCellReuseIdentifier: "BasicCell")
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "Header")
//        tableView.separatorStyle = .none
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            ])
        
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
                }
            }
            catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! Header
        headerView.headerLabel.text = "Меню Турецкой кухни"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return ovqatlar.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell") as! BasicCell
        cell.label.text = "\(indexPath.row+1). \(ovqatlar[indexPath.row].name ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController(IngridientsController(), animated: true)
        }
    }
    
}

