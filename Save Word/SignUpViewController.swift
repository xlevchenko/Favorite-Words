//
//  SlgnUpViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 12/5/22.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    let logoContainerView = UIView()
    let logoImageView = UIImageView(image: UIImage(named: "logoWhite"))
    let signUpContainerView = UIView(cornerRadius: 58, backgroundColor: .white)
    
    var fullNameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "person.fill")!)
        textField.placeholder = "Full name"
        return textField
    }()
    
    var emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "envelope.fill")!)
        textField.placeholder = "E-mail"
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.isSecureTextEntry = true
        textField.setLeftView(image: UIImage(systemName: "lock.fill")!)
        textField.placeholder = "Password"
        return textField
    }()
    
    let repeatPasswordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.isSecureTextEntry = true
        textField.setLeftView(image: UIImage(systemName: "lock.fill")!)
        textField.placeholder = "Repeat password"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.43, green: 0.38, blue: 0.98, alpha: 1.00)
        
        view.addSubview(logoContainerView)
        logoContainerView.addSubview(logoImageView)
        
        view.addSubview(signUpContainerView)
        signUpContainerView.addSubview(fullNameTextField)
        signUpContainerView.addSubview(emailTextField)
        signUpContainerView.addSubview(passwordTextField)
        signUpContainerView.addSubview(repeatPasswordTextField)
        view.updateConstraintsIfNeeded()
    }
    
    override func updateViewConstraints() {
        logoContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(40)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.25)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(logoContainerView.snp.centerX)
            make.centerY.equalTo(logoContainerView.snp.centerY)
            make.size.equalTo(CGSize(width: 240, height: 119))
        }
        
        signUpContainerView.snp.makeConstraints { make in
            make.top.equalTo(logoContainerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(100)
        }
        
        fullNameTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpContainerView.snp.top).offset(70)
            make.centerX.equalTo(signUpContainerView.snp.centerX)
            make.size.equalTo(CGSize(width: 285, height: 55))
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(fullNameTextField.snp.bottom).offset(14)
            make.centerX.equalTo(fullNameTextField.snp.centerX)
            make.size.equalTo(fullNameTextField)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.centerX.equalTo(emailTextField.snp.centerX)
            make.size.equalTo(emailTextField)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.centerX.equalTo(passwordTextField.snp.centerX)
            make.size.equalTo(passwordTextField)
        }
        
        super.updateViewConstraints()
    }
}
