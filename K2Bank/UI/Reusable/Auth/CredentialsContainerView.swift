//
//  CredentialsContainerView.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 02.02.2024.
//

import UIKit

class CredentialsContainerView: UIView {
    
    let titleLabel: UILabel = {
        $0.font = Fonts.fontCreator(font: .bold, size: 26)
        $0.textColor = AppColors.mainTextColor
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    let textLabel: UILabel = {
        $0.font = Fonts.fontCreator(font: .bold, size: 15)
        $0.textColor = AppColors.mainTextColor
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    init(title: String, subTitle: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        textLabel.text = subTitle
        setupCredentialsElements()
        setupCurrentView()
    }
    
    private func setupCurrentView() {
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 10
        self.layer.shadowColor = AppColors.shadowColor.cgColor
        self.layer.cornerRadius = 5
    }
    
    private func setupCredentialsElements() {
        self.addSubview(titleLabel)
        self.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 21),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -21),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 21),
            textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -21)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
