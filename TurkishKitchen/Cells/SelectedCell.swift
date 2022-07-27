//
//  SelectedCell.swift
//  TurkishKitchen
//
//  Created by macbook on 4/17/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class SelectedCell: UITableViewCell {
    
    let myImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .darkGray
        
        contentView.addSubview(myImage)
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.clipsToBounds = true
        myImage.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            
            myImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            myImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            myImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            myImage.heightAnchor.constraint(equalToConstant: 170),
            myImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            
            ])
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

