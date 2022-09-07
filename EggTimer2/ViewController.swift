//
//  ViewController.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class ViewController: UIViewController{
    
    let mainColor = UIColor(named: "buttonColor")
    
    var eggSize = ""
    var eggTemp = ""
    var eggType = ""
    var cookingTime = 0
    
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
    }
    
    @objc func eggTypeSelected(_ sender: EggButton){
        let eggTyper = sender.buttonTitle.text
        self.eggType = eggTyper ?? ""
        if eggType == "Soft"{
            softButton.alpha = 1
            mediumButton.alpha = 0.5
            hardButton.alpha = 0.5
        }else if eggType == "Medium"{
            softButton.alpha = 0.5
            mediumButton.alpha = 1
            hardButton.alpha = 0.5
        }else{
            softButton.alpha = 0.5
            mediumButton.alpha = 0.5
            hardButton.alpha = 1
        }
    }
    
    @IBAction func conditionSelected(_ sender: UIButton) {
        
        if let eggTemper = sender.titleLabel?.text{
            self.eggTemp = eggTemper
            if sender.titleLabel?.text == "Fridge Temperature"{
                fridegeTemp.alpha = 1
                roomTemp.alpha = 0.5
                
            }else{
                fridegeTemp.alpha = 0.5
                roomTemp.alpha = 1
            }
        }
    }
    
    
    @IBAction func sizeSelected(_ sender: UIButton) {
        if sender.titleLabel?.text == "M"{
            mediumSize.alpha = 1
            smallSize.alpha = 0.5
            largeSize.alpha = 0.5
        }else if sender.titleLabel?.text == "S"{
            mediumSize.alpha = 0.5
            smallSize.alpha = 1
            largeSize.alpha = 0.5
        }else{
            mediumSize.alpha = 0.5
            smallSize.alpha = 0.5
            largeSize.alpha = 1
            
        }
        if let eggSizer = sender.titleLabel?.text{
            self.eggSize = eggSizer
        }
    }
    
    
    
    @IBAction func startCook(_ sender: UIButton) {
        if eggTemp == ""{
            makeAlert(titleInput:"Error" , messageInput: "select egg temperature")
        }else if eggSize == ""{
            makeAlert(titleInput:"Error" , messageInput: "select egg size")
        }else if eggType == ""{
            makeAlert(titleInput:"Error" , messageInput: "select egg type")
        }else{
            var cookStart = GetEstimated()
            cookingTime = cookStart.getEstimatedBoiledTime(tempature: eggTemp, size: eggSize, hardness: eggType)
        }
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailVC
            destinationVC.counter = cookingTime
            destinationVC.eggLabel = eggType
            
            
        }
    }
    
    func makeAlert(titleInput:String,messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
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
        
        softButton.addTarget(self, action: #selector(eggTypeSelected), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(eggTypeSelected), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(eggTypeSelected), for: .touchUpInside)

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

