//
//  SplashViewController.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 21.02.2024.
//

import UIKit

class SplashViewController: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    let provider = AuthProvider()
    var finishFlow: onCheck?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.finishFlow?(provider.isAuth)
    }
}
