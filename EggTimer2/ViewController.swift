//
//  ViewController.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var eggSize = ""
    var eggTemp = ""
    
    @IBOutlet weak var boiledTypeLabel: UILabel!
    
    var eggButtonStackview = UIStackView()
    
    
    var softButton: EggButton = EggButton(image: UIImage(named: "sample")!, buttonTitle: "Soft\nBoiled")
    var mediumButton: EggButton = EggButton(image: UIImage(named: "sample")!, buttonTitle: "Medium\nBoiled")
    var hardButton: EggButton = EggButton(image: UIImage(named: "sample")!, buttonTitle: "Hard\nBoiled")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    
    func configureUI() {
        view.addSubview(eggButtonStackview)
        eggButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        eggButtonStackview.axis = .horizontal
        eggButtonStackview.distribution = .equalSpacing
        eggButtonStackview.alignment = .center
        eggButtonStackview.addArrangedSubview(softButton)
        eggButtonStackview.addArrangedSubview(mediumButton)
        eggButtonStackview.addArrangedSubview(hardButton)
        
        NSLayoutConstraint.activate([
            softButton.heightAnchor.constraint(equalToConstant: 133),
            softButton.widthAnchor.constraint(equalToConstant: 85),
            
            mediumButton.heightAnchor.constraint(equalToConstant: 133),
            mediumButton.widthAnchor.constraint(equalToConstant: 85),
            
            hardButton.heightAnchor.constraint(equalToConstant: 133),
            hardButton.widthAnchor.constraint(equalToConstant: 85),
            
            eggButtonStackview.topAnchor.constraint(equalTo: boiledTypeLabel.bottomAnchor, constant: 20),
            eggButtonStackview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            eggButtonStackview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            eggButtonStackview.heightAnchor.constraint(equalToConstant: 133)
        ])
    }
    
    @IBAction func conditionSelected(_ sender: UIButton) {
        
        if let tempatureEgg = sender.titleLabel?.text{
            eggTemp = tempatureEgg
            print(eggTemp)
        
        }
        
    }
    
    
    @IBAction func sizeSelected(_ sender: UIButton) {
        if let sizeEgg = sender.titleLabel?.text{
            eggSize = sizeEgg
            print(eggSize)
        }
        
    }
    
    
    @IBAction func startCook(_ sender: UIButton) {
        var startCook = GetEstimated()
        startCook.getEstimatedBoiledTime(tempature: eggTemp, size: eggSize, hardness: "Soft")
        
    }
    
   
}

