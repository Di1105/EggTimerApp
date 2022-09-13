//
//  DetailVC.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class DetailVC: UIViewController {

    var timeLabel = TimeLabel()
    var eggImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    
    }
    
    private func configureUI(){
        view.addSubview(timeLabel)
        view.addSubview(eggImage)
        
        eggImage.image = UIImage(named: "sample")
        eggImage.contentMode = .scaleAspectFit
        eggImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -190),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timeLabel.heightAnchor.constraint(equalToConstant: 250),
            
            eggImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            eggImage.bottomAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: -160),
            eggImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            eggImage.heightAnchor.constraint(equalToConstant: 250)
            
        ])
        
    }
    
    @objc func dismissView(){
        dismiss(animated: true, completion: nil)
    }
}
