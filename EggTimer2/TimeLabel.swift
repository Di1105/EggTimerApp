//
//  TimeLabel.swift
//  EggTimer2
//
//  Created by Dilara Elçioğlu on 12.09.2022.
//

import UIKit

class TimeLabel: UIView {
    
    var timeRemaining = 0
    
    private var border = UIView()
    private var timeLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTime(time: Int) {
        timeLabel.text = time.timeFormat()
    }
    
    private func configureUI() {
        addSubview(border)
        addSubview(timeLabel)
        
        border.layer.borderColor = UIColor(named: "buttonColor")?.cgColor
        border.layer.borderWidth = 2
        border.layer.cornerRadius = 20
        
        timeLabel.text = timeRemaining.timeFormat()
        
        timeLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        translatesAutoresizingMaskIntoConstraints = false
        border.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            border.topAnchor.constraint(equalTo: topAnchor),
            border.leadingAnchor.constraint(equalTo: leadingAnchor),
            border.bottomAnchor.constraint(equalTo: bottomAnchor),
            border.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            timeLabel.centerXAnchor.constraint(equalTo: border.centerXAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: border.bottomAnchor, constant: -90)
        ])
    }

}

extension Int {
    func timeFormat() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional

        return formatter.string(from: TimeInterval(self))!
    }
}
