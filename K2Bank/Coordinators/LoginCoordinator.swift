//
//  LoginCoordinator.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 18.02.2024.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var finishFlow: onCheck?
    
    func start() {
        let vc = LoginViewController()
        vc.coordinator = self
        let loginPresenter = LoginPresenter(viewController: vc)
        vc.presenter = loginPresenter
        navigationController?.setViewControllers([vc], animated: true)
    }
}

