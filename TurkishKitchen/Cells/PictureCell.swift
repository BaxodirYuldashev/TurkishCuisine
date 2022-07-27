//
//  PictureCell.swift
//  TurkishKitchen
//
//  Created by macbook on 4/14/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class PictureCell: UITableViewCell {
    
    let myImage = UIImageView()
    let label = UILabel()
    let label2 = UILabel()
    let starBtn = UIButton(type: .system)
    let starBtn2 = UIButton(type: .system)
    
    
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
        
        contentView.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = .clear
        label2.font = .systemFont(ofSize: 14)
        label2.numberOfLines = 0
        label2.textColor = UIColor(red: 225/255, green: 105/255, blue: 45/255, alpha: 1)
        
        contentView.addSubview(starBtn)
        starBtn.translatesAutoresizingMaskIntoConstraints = false
        starBtn.setImage(UIImage(named: "star empty")?.withRenderingMode(.alwaysOriginal), for: .normal)
        starBtn.tintColor = .black
//        starBtn.tag = 101
        starBtn.isHidden = false
//        starBtn.addTarget(self, action: #selector(starClicked(_:)), for: .touchUpInside)
        
        contentView.addSubview(starBtn2)
        starBtn2.translatesAutoresizingMaskIntoConstraints = false
        starBtn2.setImage(UIImage(named: "star gold")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        starBtn2.tag = 102
        starBtn2.isHidden = true
//        starBtn2.addTarget(self, action: #selector(starClicked(_:)), for: .touchUpInside)

        
        NSLayoutConstraint.activate([
            
            myImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            myImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            myImage.rightAnchor.constraint(equalTo: label.leftAnchor, constant: -10),
            myImage.heightAnchor.constraint(equalToConstant: 150),
            myImage.widthAnchor.constraint(equalTo: label.widthAnchor),
            myImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            label.topAnchor.constraint(equalTo: myImage.topAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.bottomAnchor.constraint(lessThanOrEqualTo: label2.topAnchor, constant: -10),
            
            label2.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label2.bottomAnchor.constraint(equalTo: myImage.bottomAnchor),
            label2.leftAnchor.constraint(equalTo: label.leftAnchor),
            
            starBtn.topAnchor.constraint(equalTo: myImage.topAnchor, constant: 10),
            starBtn.rightAnchor.constraint(equalTo: myImage.rightAnchor, constant: -10),
            starBtn.heightAnchor.constraint(equalToConstant: 20),
            starBtn.widthAnchor.constraint(equalTo: starBtn.heightAnchor),
            
            starBtn2.topAnchor.constraint(equalTo: myImage.topAnchor, constant: 10),
            starBtn2.rightAnchor.constraint(equalTo: myImage.rightAnchor, constant: -10),
            starBtn2.heightAnchor.constraint(equalToConstant: 20),
            starBtn2.widthAnchor.constraint(equalTo: starBtn.heightAnchor),
            
            ])

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    @objc func starClicked(_ sender: UIButton) {
//        if sender.tag == 101 {
//            starBtn.isHidden = true
//            starBtn2.isHidden = false
//        }
//        if sender.tag == 102 {
//            starBtn.isHidden = false
//            starBtn2.isHidden = true
//        }
//
//    }
    

   
}
