//
//  ImageCell.swift
//  TurkishKitchen
//
//  Created by macbook on 4/13/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    let myImage = UIImageView()
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .darkGray
        
        contentView.addSubview(myImage)
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.clipsToBounds = true
        myImage.contentMode = .scaleAspectFill
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 85/255, alpha: 1)
        
        NSLayoutConstraint.activate([
            
            myImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            myImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            myImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            myImage.heightAnchor.constraint(equalTo: myImage.widthAnchor),
            
            label.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 10),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            ])
        
      
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
