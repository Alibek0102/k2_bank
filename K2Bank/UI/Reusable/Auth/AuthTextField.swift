//
//  AuthTextField.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 03.02.2024.
//

import UIKit

class AuthTextField: UITextField {
    
    let iconView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    init(placeholder: String, isPassword: Bool = false) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.isSecureTextEntry = isPassword
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: self.frame.size.height))
        self.rightViewMode = .always
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 41, height: self.frame.size.height))
        setupTextField()

    }
    
    func setupTextField(){
        self.backgroundColor = AppColors.lightGrayColor1
        self.layer.borderColor = AppColors.lightGrayColor2.cgColor
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
    }
    
    func setupTextFieldRightIcon(image: UIImage) {
        iconView.image = image
        self.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -18),
            iconView.heightAnchor.constraint(equalToConstant: 23),
            iconView.widthAnchor.constraint(equalToConstant: 23)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
