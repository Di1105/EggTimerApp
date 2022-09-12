//
//  DetailVC.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class DetailVC: UIViewController {

    var boilTime = 0
    var eggLabel = ""
    private var timer = Timer()
    private var titleLabel = UILabel()
    private var backButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    
    }
    
    private func configureUI(){
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        
        titleLabel.text = "\(eggLabel) Boiled Egg"
        titleLabel.font = UIFont.systemFont(ofSize: 19)
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .label
        backButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 12),
            backButton.heightAnchor.constraint(equalToConstant: 18)
            
        ])
        
    }
    
    @objc func dismissView(){
        dismiss(animated: true, completion: nil)
    }
}
