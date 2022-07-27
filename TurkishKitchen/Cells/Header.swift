//
//  Header.swift
//  TurkishKitchen
//
//  Created by macbook on 4/12/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class Header: UITableViewHeaderFooterView {
    
    let headerLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 43/255, alpha: 1)
        
        contentView.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.backgroundColor = .clear
        headerLabel.textAlignment = .center
        headerLabel.textColor = .white
        headerLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        
        headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        headerLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
