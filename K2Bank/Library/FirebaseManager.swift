//
//  FirebaseManager.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 20.02.2024.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class FirebaseManager {
    
    static func signIn(email: String, password: String, completionHandler: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard let authResult = authResult else {
                completionHandler(false)
                return
            }
            
            completionHandler(true)
        }
    }
    
    static func userIsAuth(completionHandler: @escaping (Bool) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completionHandler(false)
            return
        }
        
        completionHandler(true)
        
    }
    
    static func signUp(email: String, password: String, completionHandler: @escaping () -> Void){
        
    }
    
    static func signOut(completionHandler: @escaping () -> Void) {
        
    }
    
}
