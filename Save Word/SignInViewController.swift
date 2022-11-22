//
//  SignInViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/13/22.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    let logoContainerView = UIView()
    let logoImageView = UIImageView(image: UIImage(named: "logoWhite"))
    let signInContainerView = UIView(cornerRadius: 58, backgroundColor: .white)
    
    let usernameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "person.fill")!)
        textField.placeholder = "Enter username or email"
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "lock.fill")!)
        textField.placeholder = "Enter password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    let signInButton = CustomButton(title: "Sign In")
    let signInSocialMediaTextLabel = SecondaryLabel("Or", fontSize: 13)
    
    let socialMediaButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fill
        return stackView
    }()
    
    let signInFacebookButton = UIButton(image: UIImage(named: "Facebook")!)
    let signInTwitterButton = UIButton(image: UIImage(named: "Twitter")!)
    let signInGoogleButton = UIButton(image: UIImage(named: "Google")!)
    
    let presentSignUpSceenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    let haveAccountTextLabel: BodyLabel = {
        let label = BodyLabel()
        label.text = "Already have an account!"
        label.textColor = .black
        return label
    }()
    
    let presentSignUpSceenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(.systemYellow, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.43, green: 0.38, blue: 0.98, alpha: 1.00)
        
        view.addSubview(logoContainerView)
        logoContainerView.addSubview(logoImageView)
        
        view.addSubview(signInContainerView)
        signInContainerView.addSubview(usernameTextField)
        signInContainerView.addSubview(passwordTextField)
        signInContainerView.addSubview(forgotPasswordButton)
        signInContainerView.addSubview(signInButton)
        signInContainerView.addSubview(signInSocialMediaTextLabel)
        
        signInContainerView.addSubview(socialMediaButtonsStackView)
        socialMediaButtonsStackView.addArrangedSubview(signInFacebookButton)
        socialMediaButtonsStackView.addArrangedSubview(signInTwitterButton)
        socialMediaButtonsStackView.addArrangedSubview(signInGoogleButton)
        
        signInContainerView.addSubview(presentSignUpSceenStackView)
        presentSignUpSceenStackView.addArrangedSubview(haveAccountTextLabel)
        presentSignUpSceenStackView.addArrangedSubview(presentSignUpSceenButton)
        
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
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(7)
            make.right.equalTo(passwordTextField.snp.right).offset(-5)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(10)
            make.centerX.equalTo(passwordTextField.snp.centerX)
            make.size.equalTo(passwordTextField)
        }
        
        signInSocialMediaTextLabel.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(20)
            make.centerX.equalTo(signInButton.snp.centerX)
        }
        
        socialMediaButtonsStackView.snp.makeConstraints { make in
            make.top.equalTo(signInSocialMediaTextLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        presentSignUpSceenStackView.snp.makeConstraints { make in
            make.top.equalTo(socialMediaButtonsStackView.snp.bottom).offset(15)
            make.centerX.equalTo(signInContainerView.snp.centerX)
        }
        super.updateViewConstraints()
    }
}
