//
//  SceneDelegate.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 26.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navVc = UINavigationController()
        let coordinator = AppCoordinator()
        coordinator.navigationController = navVc
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navVc
        window?.makeKeyAndVisible()
        coordinator.start()
    }


}

