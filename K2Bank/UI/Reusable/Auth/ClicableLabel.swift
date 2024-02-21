//
//  ClicableLabel.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 14.02.2024.
//

import UIKit

class ClicableLabel: UILabel {
    
    var actionHanler: () -> ()
    
    init(text: String, fontType: Fonts.fontType, closure: @escaping () -> ()){
        self.actionHanler = closure
        
        super.init(frame: .zero)
        self.text = text
        self.font = Fonts.fontCreator(font: fontType, size: 15)
        self.textColor = AppColors.buttonColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionHandler))
        
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func actionHandler() {
        actionHanler()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
