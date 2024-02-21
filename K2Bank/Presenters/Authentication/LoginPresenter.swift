//
//  LoginPresenter.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 19.02.2024.
//

import UIKit

protocol LoginPresenterProtocol {
    func signIn(user: User)
}

protocol LoginPresenterView {
    var presenter: LoginPresenterProtocol? { get set }
    
    func sendResultMessage(state: AuthentificationState)
    func loaderStatus(status: Bool)
}

class LoginPresenter: LoginPresenterProtocol {
    var viewController: LoginPresenterView
    var loader: Bool = false {
        didSet {
            if loader == true {
                viewController.loaderStatus(status: true)
            } else {
                viewController.loaderStatus(status: false)
            }
        }
    }
    
    init(viewController: LoginPresenterView) {
        self.viewController = viewController
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func signIn(user: User) {
        self.loader = true
        
        if isValidEmail(user.email) {
            AuthentificationService.signIn(user: user) { authResult in
                self.loader = false
                
                if authResult == false {
                    self.viewController.sendResultMessage(state: .passwordError)
                    return
                }
                self.viewController.sendResultMessage(state: .success)
            }
        } else {
            self.loader = false
            self.viewController.sendResultMessage(state: .emailError)
        }
        
    }
}

enum AuthentificationState {
    case success, emailError, passwordError
}
