//
//  ViewController.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var eggTemp = ""
    var eggSize = ""
    var eggType = ""
    var cookTime = Int()
  
  
    @IBOutlet weak var smallSize: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func eggTemp(_ sender: UIButton) {
        if let eggTempature = sender.titleLabel?.text{
            eggTemp = eggTempature
        }
    }
    
    
    @IBAction func eggSize(_ sender: UIButton) {
        if let eggSizer = sender.titleLabel?.text{
        eggSize = eggSizer
        }
    }
    
    
    @IBAction func eggType(_ sender: UIButton) {
        if let eggTyper = sender.titleLabel?.text{
        eggType = eggTyper
        }
    }
    
    @IBAction func startCook(_ sender: Any) {
      
    }
}

