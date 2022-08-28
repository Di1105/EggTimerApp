//
//  ViewController.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var smallSize: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func eggTemp(_ sender: UIButton) {
        let eggTempature = sender.titleLabel?.text
        print(eggTempature!)
        
    }
    
    
    @IBAction func eggSize(_ sender: UIButton) {
        let eggSizer = sender.titleLabel?.text
        print(eggSizer!)
        
    }
    
    
    @IBAction func eggType(_ sender: UIButton) {
        let eggTyper = sender.titleLabel?.text
        print(eggTyper!)
        
    }
    
}

