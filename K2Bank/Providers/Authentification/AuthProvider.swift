//
//  AuthProvider.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 21.02.2024.
//

import UIKit

class AuthProvider {
    var isAuth: Bool {
        get {
            var authResult = false
            
            FirebaseManager.userIsAuth { result in
                if result {
                    authResult = result
                }
            }
            
            return authResult
        }
    }
}
