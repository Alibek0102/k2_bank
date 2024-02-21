//
//  TabBarCoordinator.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 18.02.2024.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func start() {
        let vc = MainViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
    }
}
