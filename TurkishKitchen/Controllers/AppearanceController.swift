//
//  AppearanceController.swift
//  TurkishKitchen
//
//  Created by macbook on 6/14/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class AppearanceController: UIViewController {
    
    let backView = UIImageView()
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.image = UIImage(named: "turkish")
        backView.contentMode = .scaleAspectFill
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Turkish Kitchen", for: .normal)
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        button.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.white.cgColor
        
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            button.topAnchor.constraint(equalTo: backView.topAnchor, constant: 120),
            button.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -40),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 70),
            
            ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func btnClicked (_ sender: UIButton) {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
