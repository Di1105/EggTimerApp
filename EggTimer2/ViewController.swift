//
//  ViewController.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class ViewController: UIViewController{
    
    var eggSize = ""
    var eggTemp = ""
    var eggType = ""
    var cookingTime = 0
    
    @IBOutlet weak var fridegeTemp: UIButton!
    @IBOutlet weak var roomTemp: UIButton!
    @IBOutlet weak var smallSize: UIButton!
    @IBOutlet weak var mediumSize: UIButton!
    @IBOutlet weak var largeSize: UIButton!
    
    @IBOutlet weak var boiledTypeLabel: UILabel!
    
    
    
    var eggButtonStackview = UIStackView()
    
    
    var softButton: EggButton = EggButton(image: UIImage(named: "sample")!, buttonTitle: "Soft")
    var mediumButton: EggButton = EggButton(image: UIImage(named: "sample")!, buttonTitle: "Medium")
    var hardButton: EggButton = EggButton(image: UIImage(named: "sample")!, buttonTitle: "Hard")
    
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
        
        softButton.addTarget(self, action: #selector(eggTypeSelected), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(eggTypeSelected), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(eggTypeSelected), for: .touchUpInside)

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
        print(eggType)
        
        
    }
    
    @IBAction func conditionSelected(_ sender: UIButton) {
        
        if let eggTemper = sender.titleLabel?.text{
            self.eggTemp = eggTemper
            if sender.titleLabel?.text == "Fridge Temperature"{
                fridegeTemp.configuration = .filled()
                fridegeTemp.configuration?.title = "Fridge Temperature"
                roomTemp.configuration = .plain()
                roomTemp.configuration?.title = "Room Temperature"
                
                
            }else{
                roomTemp.configuration = .filled()
                roomTemp.configuration?.title = "Room Temperature"
                fridegeTemp.configuration = .plain()
                fridegeTemp.configuration?.title = "Fridge Temperature"
            }
            print(eggTemp)
        
        }
        
    }
    
    
    @IBAction func sizeSelected(_ sender: UIButton) {
        if sender.titleLabel?.text == "M"{
            mediumSize.configuration = .filled()
            mediumSize.configuration?.title = "M"
            smallSize.configuration = .plain()
            smallSize.configuration?.title = "S"
            largeSize.configuration = .plain()
            largeSize.configuration?.title = "L"
        }else if sender.titleLabel?.text == "S"{
            smallSize.configuration = .filled()
            smallSize.configuration?.title = "S"
            mediumSize.configuration = .plain()
            mediumSize.configuration?.title = "M"
            largeSize.configuration = .plain()
            largeSize.configuration?.title = "L"
        }else{
            largeSize.configuration = .filled()
            largeSize.configuration?.title = "L"
            smallSize.configuration = .plain()
            smallSize.configuration?.title = "S"
            mediumSize.configuration = .plain()
            mediumSize.configuration?.title = "M"
            
        }
        if let eggSizer = sender.titleLabel?.text{
            self.eggSize = eggSizer
            print(eggSize)
            
            
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
            print(cookingTime)
            
            }
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailVC
            destinationVC.counter = cookingTime
            //destinationVC.whichEggLabel.text = "\(eggType) Boiled Egg"
            
            
        }
    }
    
    func makeAlert(titleInput:String,messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
   
}

