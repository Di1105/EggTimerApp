//
//  DetailVC.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 24.08.2022.
//

import UIKit

class DetailVC: UIViewController {

    var egg: Egg?

    private lazy var timeRemaining: Int? = egg?.getEstimatedBoiledTime()
    private var timer: Timer?
    private var timeLabel = TimeLabel()
    private var eggImage = UIImageView()
    private var timerButton = UIButton()
    private var screenTitle = UILabel()
    private var dismissButton = UIButton()
    
    private var isTimerValid: Bool {
        if timer != nil {
            return timer!.isValid
        } else {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        invalidateTimer()
    }
    
    private func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func timerButtonTapped() {
        if isTimerValid {
            timer?.invalidate()
            timerButton.setTitle("Start", for: .normal)
        } else {
            configureTimer()
            timerButton.setTitle("Pause", for: .normal)
        }
    }
    
    private func configureTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(tick),
                                         userInfo: nil,
                                         repeats: true)
    }
    
    @objc private func tick() {
        timeLabel.updateTime(time: timeRemaining!)
        timeRemaining = timeRemaining! - 1
        print(timeRemaining!)
        if timeRemaining! == 0 {
            timer?.invalidate()
            timeLabel.updateTime(time: timeRemaining!)
            timerEnded()
        }
    }
    
    private func timerEnded() {
        let alert = UIAlertController(title: "Your egg is ready!", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    private func configureUI(){
        view.addSubview(timeLabel)
        view.addSubview(eggImage)
        view.addSubview(timerButton)
        view.addSubview(screenTitle)
        view.addSubview(dismissButton)
        
        timeLabel.updateTime(time: timeRemaining!)
        
        eggImage.image = UIImage(named: egg!.hardness.rawValue.lowercased())
        eggImage.contentMode = .scaleAspectFit
        eggImage.translatesAutoresizingMaskIntoConstraints = false
        
        timerButton.layer.cornerRadius = 10
        timerButton.addTarget(self, action: #selector(timerButtonTapped), for: .touchUpInside)
        timerButton.backgroundColor = UIColor(named: "buttonColor")
        timerButton.setTitle("Pause", for: .normal)
        timerButton.setTitleColor(.systemBackground, for: .normal)
        timerButton.translatesAutoresizingMaskIntoConstraints = false
        
        screenTitle.text = "Egg"
        screenTitle.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        dismissButton.setImage(UIImage(systemName: "multiply"), for: .normal)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
                               
                               
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -190),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timeLabel.heightAnchor.constraint(equalToConstant: 250),
            
            eggImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            eggImage.bottomAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: -160),
            eggImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            eggImage.heightAnchor.constraint(equalToConstant: 250),
            
            timerButton.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: 18),
            timerButton.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: -18),
            timerButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: -30),
            timerButton.heightAnchor.constraint(equalToConstant: 60),
            
            screenTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            dismissButton.centerYAnchor.constraint(equalTo: screenTitle.centerYAnchor),
            dismissButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            dismissButton.heightAnchor.constraint(equalToConstant: 18),
            dismissButton.widthAnchor.constraint(equalToConstant: 12)
            
        ])
    }
    
    @objc func dismissView(){
        dismiss(animated: true, completion: nil)
    }
}
