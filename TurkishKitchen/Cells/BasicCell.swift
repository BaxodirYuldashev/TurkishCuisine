//
//  BasicCell.swift
//  TurkishKitchen
//
//  Created by macbook on 4/12/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {
    
    let icon = UIImageView()
    let label = UILabel()
    let selectedBtn = UIButton(type: .system)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(selectedBtn)
        selectedBtn.translatesAutoresizingMaskIntoConstraints = false
        selectedBtn.backgroundColor = .clear
        
        
        selectedBtn.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        selectedBtn.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .black
        
        
        NSLayoutConstraint.activate([
            
            selectedBtn.topAnchor.constraint(equalTo: contentView.topAnchor),
            selectedBtn.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            selectedBtn.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            selectedBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            icon.topAnchor.constraint(equalTo: selectedBtn.topAnchor, constant: 10),
            icon.leftAnchor.constraint(equalTo: selectedBtn.leftAnchor, constant: 10),
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalToConstant: 20),
            
            label.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            label.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: selectedBtn.rightAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: selectedBtn.bottomAnchor, constant: -10),
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
