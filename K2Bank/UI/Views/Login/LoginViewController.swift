//
//  LoginViewController.swift
//  K2Bank
//
//  Created by Алибек Аблайулы on 26.01.2024.
//

import UIKit
import JGProgressHUD
import Toast

class LoginViewController: UIViewController, Coordinating, LoginPresenterView {
    
    var coordinator: Coordinator?
    var presenter: LoginPresenterProtocol?
    
    var afterAuthentification: onCheck?
    
    let hud = JGProgressHUD()
    
    let header = AuthHeaderView()
    let container = CredentialsContainerView(title: "Log in to your account", subTitle: "Sign in with Email")
    let emailTextField = AuthTextField(placeholder: "Email")
    let passwordTextField = AuthTextField(placeholder: "Password", isPassword: true)
    let forgotPasswordLabel = ClicableLabel(text: "Forgot your password?", fontType: .bold) {
        print("okok")
    }
    let loginButton = CustomButton(title: "Log in")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.primaryColor
        setupViewControllerUI()
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        self.setupHud()
        self.setupToast()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.tag = 1
        passwordTextField.tag = 2
        
    }
    
    func setupHud() {
        hud.textLabel.text = "Loading..."
        hud.backgroundColor = .black.withAlphaComponent(0.7)
    }
    
    func setupToast() {
        var style = ToastStyle()
        style.cornerRadius = 15
        style.backgroundColor = AppColors.errorColor
        style.horizontalPadding = 20
        style.messageFont = Fonts.fontCreator(font: .medium, size: 16)
        style.fadeDuration = 0.5
        
        ToastManager.shared.style = style
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    @objc func loginButtonTapped() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        let user = User(email: email, password: password)
        
        presenter?.signIn(user: user)
    }
    
    func setupViewControllerUI() {
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.setupTextFieldRightIcon(image: .email)
        
        container.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(forgotPasswordLabel)
        
        container.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor),
            header.heightAnchor.constraint(equalToConstant: 106),
            
            container.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 33),
            container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),
            container.heightAnchor.constraint(equalToConstant: 436),
            
            emailTextField.topAnchor.constraint(equalTo: container.topAnchor, constant: 123),
            emailTextField.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 21),
            emailTextField.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -21),
            emailTextField.heightAnchor.constraint(equalToConstant: 49),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 18),
            passwordTextField.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 21),
            passwordTextField.rightAnchor.constraint(equalTo: container.rightAnchor, constant:  -21),
            passwordTextField.heightAnchor.constraint(equalToConstant: 49),
            
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12),
            forgotPasswordLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 21),
            
            loginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 38),
            loginButton.heightAnchor.constraint(equalToConstant: 52),
            loginButton.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 21),
            loginButton.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -21),
        ])
    }
    
    func sendResultMessage(state: AuthentificationState) {
        switch state {
        case .success: self.afterAuthentification?(true)
        case .emailError: self.showToastMessage(text: "Неправильный email")
        case .passwordError: self.showToastMessage(text: "Неправильный email или пароль")
        }
    }
    
    func loaderStatus(status: Bool) {
        DispatchQueue.main.async {
            self.showLoader(status: status)
        }
    }
}

extension LoginViewController {
    func showLoader(status: Bool) {
        if status == true {
            hud.show(in: view, animated: true)
        } else {
            hud.dismiss(animated: true)
        }
    }
    
    func showToastMessage(text: String) {
        self.view.makeToast(text, duration: 3, position: .top)
    }
}
    
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }
}
