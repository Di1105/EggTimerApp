//
//  DetailVC.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class DetailVC: UIViewController {

    var counter = 0
    var timer = Timer()
    
    @IBOutlet weak var eggImage: UIImageView!
    
    @IBOutlet weak var whichEggLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eggImage.image = UIImage(named: "egg1")
        timeLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction(){
        timeLabel.text = "Time: \(counter)"
        counter=counter-1
        if counter == 0 {
            timer.invalidate()
            timeLabel.text="Egg is ready to eat!"
            eggImage.image = UIImage(named: "egg2")
        }
    }
    

    @IBAction func pauseButton(_ sender: Any) {
    }


}
