//
//  Coordinator.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 19.02.2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func start()
}


protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
