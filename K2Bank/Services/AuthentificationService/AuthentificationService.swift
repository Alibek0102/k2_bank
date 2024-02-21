//
//  File.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 20.02.2024.
//

import UIKit

class AuthentificationService {
    static func signIn(user: User, completionHandler: @escaping (Bool) -> ()){
        FirebaseManager.signIn(email: user.email, password: user.password) { boleanResult in
            completionHandler(boleanResult)
        }
    }
}
