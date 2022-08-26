//
//  ViewController.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boiledTypeLabel: UILabel!
    
    var softButton: EggButton = EggButton(image: UIImage(), buttonTitle: "Soft\nBoiled")
    var mediumButton: EggButton = EggButton(image: UIImage(), buttonTitle: "Medium\nBoiled")
    var hardButton: EggButton = EggButton(image: UIImage(), buttonTitle: "Hard\nBoiled")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    @IBAction func fridgeTemButton(_ sender: Any) {
    }
    @IBAction func roomTempbutton(_ sender: Any) {
    }
    
    @IBAction func smallButton(_ sender: Any) {
    }
    
    @IBAction func mediumButton(_ sender: Any) {
    }
    
    @IBAction func largebutton(_ sender: Any) {
    }
    
    
    @IBAction func startCookButton(_ sender: Any) {
    }
    
    func configureUI() {
        view.addSubview(softButton)
        view.addSubview(mediumButton)
        view.addSubview(hardButton)
        NSLayoutConstraint.activate([
            softButton.topAnchor.constraint(equalTo: boiledTypeLabel.bottomAnchor, constant: 20),
            softButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            softButton.heightAnchor.constraint(equalToConstant: 133),
            softButton.widthAnchor.constraint(equalToConstant: 85),
            
            mediumButton.topAnchor.constraint(equalTo: boiledTypeLabel.bottomAnchor, constant: 20),
            mediumButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mediumButton.heightAnchor.constraint(equalToConstant: 133),
            mediumButton.widthAnchor.constraint(equalToConstant: 85),
            
            hardButton.topAnchor.constraint(equalTo: boiledTypeLabel.bottomAnchor, constant: 20),
            hardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            hardButton.heightAnchor.constraint(equalToConstant: 133),
            hardButton.widthAnchor.constraint(equalToConstant: 85)
        ])
    }
    
}

