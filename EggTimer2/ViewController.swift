//
//  ViewController.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class ViewController: UIViewController{
    
    var egg = Egg()
            
    @IBOutlet weak var fridegeTemp: UIButton!
    @IBOutlet weak var roomTemp: UIButton!
    @IBOutlet weak var smallSize: UIButton!
    @IBOutlet weak var mediumSize: UIButton!
    @IBOutlet weak var largeSize: UIButton!
    
    @IBOutlet weak var boiledTypeLabel: UILabel!
    
    
    
    var eggButtonStackview = UIStackView()
    
    var softButton: EggButton = EggButton(image: UIImage(named: "soft")!, buttonTitle: "Soft\nBoiled")
    var mediumButton: EggButton = EggButton(image: UIImage(named: "medium")!, buttonTitle: "Medium\nBoiled")
    var hardButton: EggButton = EggButton(image: UIImage(named: "hard")!, buttonTitle: "Hard\nBoiled")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(eggButtonStackview)
        eggButtonStackview.translatesAutoresizingMaskIntoConstraints = false
        eggButtonStackview.axis = .horizontal
        eggButtonStackview.distribution = .equalSpacing
        eggButtonStackview.spacing = 16
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
            
            eggButtonStackview.topAnchor.constraint(equalTo: boiledTypeLabel.bottomAnchor, constant: 34),
            eggButtonStackview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            eggButtonStackview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            eggButtonStackview.heightAnchor.constraint(equalToConstant: 133)
        ])
        
        fridegeTemp.tag = 1
        roomTemp.tag = 2
        
        smallSize.tag = 1
        mediumSize.tag = 2
        largeSize.tag = 3
        
        softButton.tag = 1
        mediumButton.tag = 2
        hardButton.tag = 3
        
        softButton.addTarget(self, action: #selector(eggTypeSelected), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(eggTypeSelected), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(eggTypeSelected), for: .touchUpInside)
        
        fridegeTemp.addTarget(self, action: #selector(temperatureSelected), for: .touchUpInside)
        roomTemp.addTarget(self, action: #selector(temperatureSelected), for: .touchUpInside)
        
        smallSize.addTarget(self, action: #selector(sizeSelected), for: .touchUpInside)
        mediumSize.addTarget(self, action: #selector(sizeSelected), for: .touchUpInside)
        largeSize.addTarget(self, action: #selector(sizeSelected), for: .touchUpInside)
        
    }
    
    @objc func eggTypeSelected(_ sender: EggButton){
        if sender.tag == 1 {
            egg.setEggHardness(hardness: .soft)
        } else if sender.tag == 2 {
            egg.setEggHardness(hardness: .medium)
        } else if sender.tag == 3 {
            egg.setEggHardness(hardness: .hard)
        }
    }
    
    @objc func temperatureSelected(_ sender: UIButton) {
        
        if sender.tag == 1 {
            egg.setEggTemperature(temp: .fridge)
        } else if sender.tag == 2 {
            egg.setEggTemperature(temp: .room)
        }
    }
    
    
    @objc func sizeSelected(_ sender: UIButton) {
        if sender.tag == 1 {
            egg.setEggSize(size: .small)
        } else if sender.tag == 2 {
            egg.setEggSize(size: .medium)
        } else if sender.tag == 3 {
            egg.setEggSize(size: .large)
        }
    }
    
    
    
    @IBAction func startCook(_ sender: UIButton) {
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailVC
            destinationVC.counter = egg.getEstimatedBoiledTime()
            destinationVC.eggLabel = egg.getEggLabel()
            
            
        }
    }
}

