//
//  StartCoordinator.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 18.02.2024.
//

import UIKit

class StartCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var finishFlow: onCheck?
    
    func start() {
        let viewController = SplashViewController()
        viewController.coordinator = self
        navigationController?.setViewControllers([viewController], animated: true)
    }
}
