//
//  CollectionViewCell.swift
//  TurkishKitchen
//
//  Created by macbook on 5/6/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
     let starBtn = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        contentView.addSubview(starBtn)
        starBtn.translatesAutoresizingMaskIntoConstraints = false
        starBtn.setImage(UIImage(named: "star empty")?.withRenderingMode(.alwaysOriginal), for: .normal)
        starBtn.tintColor = .black
        starBtn.isHidden = false
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            starBtn.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            starBtn.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -10),
            starBtn.heightAnchor.constraint(equalToConstant: 20),
            starBtn.widthAnchor.constraint(equalTo: starBtn.heightAnchor),
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
