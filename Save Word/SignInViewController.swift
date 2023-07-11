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
    let signInContainerView = UIView(cornerRadius: 59, backgroundColor: .white)
    
    var signInSceenLabel: TitleLabel = {
        let label = TitleLabel("Sign In", fontSize: 30)
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "person.fill")!)
        textField.placeholder = "E-mail"
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "lock.fill")!)
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    let signInButton = CustomButton(title: "Sign In")
    let signInSocialMediaTextLabel = SecondaryLabel("OR", fontSize: 10)
    
    let signInFacebookButton = UIButton(image: UIImage(named: "Facebook 1")!)
    let signInGoogleButton = UIButton(image: UIImage(named: "Google 1")!)
    
    lazy var socialMediaButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signInFacebookButton, signInGoogleButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let showSignUpSceenLabel: BodyLabel = {
        let label = BodyLabel()
        label.text = "Don’t have an account? "
        label.textColor = .black
        return label
    }()
    
    let showSignUpSceenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 0.43, green: 0.38, blue: 0.98, alpha: 1.00), for: .normal)
        return button
    }()
    
    lazy var showSignUpSceenStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [showSignUpSceenLabel, showSignUpSceenButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.43, green: 0.38, blue: 0.98, alpha: 1.00)
        
        view.addSubview(logoContainerView)
        logoContainerView.addSubview(logoImageView)
        
        view.addSubview(signInContainerView)
        signInContainerView.addSubview(signInSceenLabel)
        signInContainerView.addSubview(emailTextField)
        signInContainerView.addSubview(passwordTextField)
        signInContainerView.addSubview(forgotPasswordButton)
        signInContainerView.addSubview(signInButton)
        signInContainerView.addSubview(signInSocialMediaTextLabel)
        
        signInContainerView.addSubview(socialMediaButtonsStackView)
        signInContainerView.addSubview(showSignUpSceenStackView)
        
        view.updateConstraintsIfNeeded()
        
        signInButton.addTarget(self, action: #selector(showSWTabBarScreen), for: .touchUpInside)
        showSignUpSceenButton.addTarget(self, action: #selector(showSignUpScreen), for: .touchUpInside)
    }
    
    @objc func showSWTabBarScreen() {
        let destination = SWTabBarController()
        let navigationController = UINavigationController(rootViewController: destination)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
    
    @objc func showSignUpScreen() {
        let destination = SignUpViewController()
        let navigationController = UINavigationController(rootViewController: destination)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
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
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(40)
        }
        
        signInSceenLabel.snp.makeConstraints { make in
            make.top.equalTo(signInContainerView.snp.top).offset(30)
            make.centerX.equalTo(signInContainerView.snp.centerX)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(signInSceenLabel.snp.bottom).offset(25)
            make.left.equalTo(signInContainerView.snp.left).offset(40)
            make.right.equalTo(signInContainerView.snp.right).offset(-40)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.left.right.equalTo(emailTextField)
            make.size.equalTo(emailTextField)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(7)
            make.right.equalTo(passwordTextField.snp.right).offset(-5)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(25)
            make.left.right.equalTo(passwordTextField)
            make.size.equalTo(passwordTextField)
        }
        
        signInSocialMediaTextLabel.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(15)
            make.centerX.equalTo(signInButton.snp.centerX)
        }
        
        socialMediaButtonsStackView.snp.makeConstraints { make in
            make.top.equalTo(signInSocialMediaTextLabel.snp.bottom).offset(10)
            make.left.equalTo(signInButton.snp.left)
            make.right.equalTo(signInButton.snp.right)
        }
        
        showSignUpSceenStackView.snp.makeConstraints { make in
            make.top.equalTo(socialMediaButtonsStackView.snp.bottom).offset(15)
            make.centerX.equalTo(socialMediaButtonsStackView.snp.centerX)
        }
        super.updateViewConstraints()
    }
}
