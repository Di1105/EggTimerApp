//
//  ViewController.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class ViewController: UIViewController{
    
    let mainColor = UIColor(named: "buttonColor")
    
    var egg = Egg()
            
    @IBOutlet weak var fridegeTemp: UIButton!
    @IBOutlet weak var roomTemp: UIButton!
    @IBOutlet weak var smallSize: UIButton!
    @IBOutlet weak var mediumSize: UIButton!
    @IBOutlet weak var largeSize: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var boiledTypeLabel: UILabel!
    
    var eggButtonStackview = UIStackView()
    
    var softButton: EggButton = EggButton(image: UIImage(named: "sample")!, buttonTitle: "Soft")
    var mediumButton: EggButton = EggButton(image: UIImage(named: "sample")!, buttonTitle: "Medium")
    var hardButton: EggButton = EggButton(image: UIImage(named: "sample")!, buttonTitle: "Hard")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureButtons()
        adjustTemperatureButtonState()
        adjustHardnessButtonState()
        adjustSizeButtonState()
    }
    
    
    
    @objc func eggTypeSelected(_ sender: EggButton){
        if sender.tag == 1 {
            egg.setEggHardness(hardness: .soft)
        } else if sender.tag == 2 {
            egg.setEggHardness(hardness: .medium)
        } else if sender.tag == 3 {
            egg.setEggHardness(hardness: .hard)
        }
        adjustHardnessButtonState()
    }

    @objc func temperatureSelected(_ sender: UIButton) {
        
        if sender.tag == 1 {
            egg.setEggTemperature(temp: .fridge)
        } else if sender.tag == 2 {
            egg.setEggTemperature(temp: .room)
        }
        adjustTemperatureButtonState()
    }
    
    @objc func sizeSelected(_ sender: UIButton) {
        if sender.tag == 1 {
            egg.setEggSize(size: .small)
        } else if sender.tag == 2 {
            egg.setEggSize(size: .medium)
        } else if sender.tag == 3 {
            egg.setEggSize(size: .large)
        }
        adjustSizeButtonState()
    }
    
    
    @IBAction func startCook(_ sender: UIButton) {
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailVC
//            destinationVC.boilTime = egg.getEstimatedBoiledTime()
//            destinationVC.eggLabel = egg.getEggLabel()
            
            
        }
    }
    
    func adjustTemperatureButtonState() {
        switch egg.temperature {
        case .fridge:
            roomTemp.alpha = 0.5
            fridegeTemp.alpha = 1
        case .room:
            roomTemp.alpha = 1
            fridegeTemp.alpha = 0.5
        }
    }
    
    func adjustHardnessButtonState() {
        switch egg.hardness {
        case .soft:
            softButton.alpha = 1
            mediumButton.alpha = 0.5
            hardButton.alpha = 0.5
        case .medium:
            softButton.alpha = 0.5
            mediumButton.alpha = 1
            hardButton.alpha = 0.5
        case .hard:
            softButton.alpha = 0.5
            mediumButton.alpha = 0.5
            hardButton.alpha = 1
        }
    }
    
    func adjustSizeButtonState(){
        switch egg.size {
        case .large:
            smallSize.alpha = 0.5
            mediumSize.alpha = 0.5
            largeSize.alpha = 1
        case .medium:
            smallSize.alpha = 0.5
            mediumSize.alpha = 1
            largeSize.alpha = 0.5
        case .small:
            smallSize.alpha = 1
            mediumSize.alpha = 0.5
            largeSize.alpha = 0.5
        }
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
            softButton.heightAnchor.constraint(equalToConstant: 150),
            softButton.widthAnchor.constraint(equalToConstant: 100),
            
            mediumButton.heightAnchor.constraint(equalToConstant: 150),
            mediumButton.widthAnchor.constraint(equalToConstant: 100),
            
            hardButton.heightAnchor.constraint(equalToConstant: 150),
            hardButton.widthAnchor.constraint(equalToConstant: 100),
            
            eggButtonStackview.topAnchor.constraint(equalTo: boiledTypeLabel.bottomAnchor, constant: 34),
            eggButtonStackview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            eggButtonStackview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            eggButtonStackview.heightAnchor.constraint(equalToConstant: 150)
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
    
    func configureButtons() {
        let borderWidth: CGFloat = 1
        let cornerRadius: CGFloat = 10
        fridegeTemp.layer.borderWidth = borderWidth
        fridegeTemp.layer.cornerRadius = cornerRadius
        fridegeTemp.layer.borderColor = mainColor?.cgColor
        fridegeTemp.setTitleColor(mainColor, for: .normal)
        roomTemp.layer.borderWidth = borderWidth
        roomTemp.layer.cornerRadius = cornerRadius
        roomTemp.layer.borderColor = mainColor?.cgColor
        roomTemp.setTitleColor(mainColor, for: .normal)
        smallSize.layer.borderWidth = borderWidth
        smallSize.layer.cornerRadius = cornerRadius
        smallSize.layer.borderColor = mainColor?.cgColor
        smallSize.setTitleColor(mainColor, for: .normal)
        mediumSize.layer.borderWidth = borderWidth
        mediumSize.layer.cornerRadius = cornerRadius
        mediumSize.layer.borderColor = mainColor?.cgColor
        mediumSize.setTitleColor(mainColor, for: .normal)
        largeSize.layer.borderWidth = borderWidth
        largeSize.layer.cornerRadius = cornerRadius
        largeSize.layer.borderColor = mainColor?.cgColor
        largeSize.setTitleColor(mainColor, for: .normal)
        startButton.layer.cornerRadius = cornerRadius
        startButton.setTitleColor(.systemBackground, for: .normal)
        startButton.backgroundColor = UIColor(named: "buttonColor")
    }
}

