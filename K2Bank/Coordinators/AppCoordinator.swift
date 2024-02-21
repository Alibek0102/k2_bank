//
//  AppCoordinator.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 18.02.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var isAuth: Bool = false
    var isFirstLaunch: Bool = true
    
    func start() {
        if isFirstLaunch {
            self.showSplashScreen()
            isFirstLaunch = false
            return
        }
        
        if isAuth == true {
            self.showMainFlow()
        } else {
            self.showLoginFlow()
        }
    }
    
    func showSplashScreen() {
        let startCoordinator = StartCoordinator()
        startCoordinator.finishFlow = { result in
            self.isAuth = result
            self.start()
        }
        startCoordinator.navigationController = navigationController
        startCoordinator.start()
    }
    
    func showLoginFlow() {
        let loginCoordinator = LoginCoordinator()
        loginCoordinator.finishFlow = { result in
            self.isAuth = true
            self.start()
        }
        loginCoordinator.navigationController = navigationController
        loginCoordinator.start()
    }
    
    func showMainFlow() {
        let tabBarCoordinator = TabBarCoordinator()
        tabBarCoordinator.navigationController = navigationController
        tabBarCoordinator.start()
    }
}

