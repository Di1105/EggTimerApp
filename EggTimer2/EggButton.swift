//
//  EggButton.swift
//  EggButton
//
//  Created by Fatih Sağlam on 25.08.2022.
//

import UIKit

class EggButton: UIButton {
    
    var eggImage = UIImageView()
    var buttonTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    init(image: UIImage, buttonTitle: String) {
        super.init(frame: .zero)
        self.eggImage.image = image
        self.buttonTitle.text = buttonTitle
        configureUI()
    }
    
    private func configureUI() {
        addSubview(buttonTitle)
        addSubview(eggImage)
        eggImage.contentMode = .scaleAspectFit
        buttonTitle.numberOfLines = 2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 15
        bringSubviewToFront(eggImage)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        eggImage.translatesAutoresizingMaskIntoConstraints = false
        buttonTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            buttonTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            buttonTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            
            eggImage.topAnchor.constraint(equalTo: topAnchor, constant: -padding),
            eggImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            eggImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            eggImage.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
    }
    
}

