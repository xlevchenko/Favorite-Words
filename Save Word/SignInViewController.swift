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
    
    private var signInContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 58
        view.backgroundColor = .white
        return view
    }()
    
    let usernameTextField = CustomTextField(
        image: UIImage(systemName: "person.fill")!,
        placeholder: "Enter username or email")

    let passwordTextField = CustomTextField(
        image: UIImage(systemName: "lock.fill")!,
        placeholder: "Enter password",
        isSecure: true)
    
    let forgotPasswordButton = UIButton(
        title: "Forgot password?",
        font: .systemFont(ofSize: 12, weight: .regular),
        color: .secondaryLabel)
        
    let signInButton = CustomButton(title: "Sign In")
    
    private var signInSocialMediaTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.tintColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        label.font  = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    let signInFacebookButton = UIButton(image: UIImage(named: "Facebook")!)
    let signInTwitterButton = UIButton(image: UIImage(named: "Twitter")!)
    let signInGoogleButton = UIButton(image: UIImage(named: "Google")!)
        
    private var socialMediaButtonsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.distribution = .fill
        return stack
    }()
    
    private var alreadyHaveAccountTextLabel = {
        let label = UILabel()
        label.text = "Already have an account!"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private var presentSignUpSceenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 1.00, green: 0.79, blue: 0.24, alpha: 1.00), for: .normal)
        return button
    }()
    
    private var presentSignUpSceenStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .equalCentering
        return stack
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
        presentSignUpSceenStackView.addArrangedSubview(alreadyHaveAccountTextLabel)
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
