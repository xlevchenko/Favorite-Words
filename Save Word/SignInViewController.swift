//
//  SignInViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/13/22.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    private var logoContainerView: UIView = {
        let view = UIView()
        //view.backgroundColor = .white
        return view
    }()
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoWhite")
        return imageView
    }()
    
    private var signInContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 58
        view.backgroundColor = .white
        return view
    }()
    
    private var usernameTextField: UITextField = {
        let textField = CustomTextField()
        textField.placeholder = "Enter username or email"
        textField.setLeftView(image: UIImage(systemName: "person.fill")!)
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = CustomTextField()
        textField.placeholder = "Enter password"
        textField.setLeftView(image: UIImage(systemName: "lock.fill")!)
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.43, green: 0.38, blue: 0.98, alpha: 1.00)
        
        view.addSubview(logoContainerView)
        logoContainerView.addSubview(logoImageView)
        view.addSubview(signInContainerView)
        signInContainerView.addSubview(usernameTextField)
        signInContainerView.addSubview(passwordTextField)
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
        
        signInContainerView.snp.makeConstraints { make in
            make.top.equalTo(logoContainerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(100)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(signInContainerView.snp.top).offset(70)
            make.centerX.equalTo(signInContainerView.snp.centerX)
            make.size.equalTo(CGSize(width: 260, height: 50))
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(10)
            make.centerX.equalTo(usernameTextField.snp.centerX)
            make.size.equalTo(usernameTextField)
        }
        super.updateViewConstraints()
    }
    
}
