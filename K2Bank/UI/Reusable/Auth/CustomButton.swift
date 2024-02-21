//
//  CustomButton.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 14.02.2024.
//

import UIKit

class CustomButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.layer.cornerRadius = 5
        self.backgroundColor = AppColors.buttonColor
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = Fonts.fontCreator(font: .bold, size: 16)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
