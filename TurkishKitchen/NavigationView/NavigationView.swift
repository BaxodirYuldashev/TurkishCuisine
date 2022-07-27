//
//  NavigationView.swift
//  TurkishKitchen
//
//  Created by macbook on 4/12/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class NavigationView: UIView{
    
    let optionsBtn = UIButton(type: .system)
    let nameLabel = UILabel()
    let rightBtn = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(optionsBtn)
        optionsBtn.translatesAutoresizingMaskIntoConstraints = false
        optionsBtn.setImage(UIImage(named: "options")?.withRenderingMode(.alwaysTemplate), for: .normal)
        optionsBtn.tintColor = UIColor(red: 250/255, green: 148/255, blue: 39/255, alpha: 1)
        
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        nameLabel.textColor = UIColor(red: 250/255, green: 148/255, blue: 39/255, alpha: 1)
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        
        addSubview(rightBtn)
        rightBtn.translatesAutoresizingMaskIntoConstraints = false
        rightBtn.setImage(UIImage(named: "remove basket")?.withRenderingMode(.alwaysTemplate), for: .normal)
        rightBtn.tintColor = UIColor(red: 250/255, green: 148/255, blue: 39/255, alpha: 1)
        
        NSLayoutConstraint.activate([
            
            optionsBtn.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            optionsBtn.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10),
            optionsBtn.heightAnchor.constraint(equalToConstant: 20),
            optionsBtn.widthAnchor.constraint(equalToConstant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.leftAnchor.constraint(equalTo: optionsBtn.rightAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(lessThanOrEqualTo: self.rightAnchor,constant: -10),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10),
            
            rightBtn.topAnchor.constraint(equalTo: optionsBtn.topAnchor),
            rightBtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            rightBtn.heightAnchor.constraint(equalToConstant: 20),
            rightBtn.widthAnchor.constraint(equalToConstant: 20),
            
            
            ])
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

