//
//  AuthHeaderView.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 02.02.2024.
//

import UIKit

class AuthHeaderView: UIView {
    
    let imageView: UIImageView = {
        $0.image = .appIcon
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    init() {
        super.init(frame: .zero)
        setupHeaderInterface()
    }
    
    private func setupHeaderInterface() {
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 190),
            imageView.heightAnchor.constraint(equalToConstant: 66)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
