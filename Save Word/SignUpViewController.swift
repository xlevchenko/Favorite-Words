//
//  SlgnUpViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 12/5/22.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    private var sharedConstraints: [NSLayoutConstraint] = []
    
    let logoContainerView = UIView()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logoWhite"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let signUpContainerView = UIView(cornerRadius: 40, backgroundColor: .white)
    
    var createAccountLabel: TitleLabel = {
        let label = TitleLabel("Create new account", fontSize: 26)
        label.textColor = .black
        return label
    }()
    
    var getStartedLabel: SecondaryLabel = {
       let label = SecondaryLabel("Please put your information below to create\n a new account for using the app.", fontSize: 13)
        return label
    }()
    
    var fullNameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "person.fill")!)
        textField.placeholder = "Enter your name"
        return textField
    }()
    
    var emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "envelope.fill")!)
        textField.placeholder = "Enter your email"
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.isSecureTextEntry = true
        textField.setLeftView(image: UIImage(systemName: "lock.fill")!)
        textField.placeholder = "Enter your password"
        return textField
    }()
    
    let repeatPasswordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.isSecureTextEntry = true
        textField.setLeftView(image: UIImage(systemName: "lock.fill")!)
        textField.placeholder = "Repeat your password"
        return textField
    }()
    
    let signUpButton = CustomButton(title: "Sign Up")
    
    let signUpSocialMediaTextLabel = SecondaryLabel("OR", fontSize: 10)
    
    let socialMediaButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let signUpFacebookButton = UIButton(image: UIImage(named: "Facebook 1")!)
    let signUpGoogleButton = UIButton(image: UIImage(named: "Google 1")!)
    
    let presentSignUpSceenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let haveAccountTextLabel: BodyLabel = {
        let label = BodyLabel()
        label.text = "Already have an account! "
        label.textColor = .black
        return label
    }()
    
    let showSignInSceenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        //stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    let haveAccountLabel: BodyLabel = {
        let label = BodyLabel()
        label.text = "Already have an account! "
        label.textColor = .black
        return label
    }()
    
    let showSignUpSceenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 0.43, green: 0.38, blue: 0.98, alpha: 1.00), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.43, green: 0.38, blue: 0.98, alpha: 1.00)
        view.addSubview(logoContainerView)
        logoContainerView.addSubview(logoImageView)
        
        view.addSubview(signUpContainerView)
        signUpContainerView.addSubview(createAccountLabel)
        signUpContainerView.addSubview(getStartedLabel)
        signUpContainerView.addSubview(fullNameTextField)
        signUpContainerView.addSubview(emailTextField)
        signUpContainerView.addSubview(passwordTextField)
        signUpContainerView.addSubview(repeatPasswordTextField)
        signUpContainerView.addSubview(signUpButton)
        
        signUpContainerView.addSubview(signUpSocialMediaTextLabel)
        signUpContainerView.addSubview(socialMediaButtonsStackView)
        socialMediaButtonsStackView.addArrangedSubview(signUpFacebookButton)
        socialMediaButtonsStackView.addArrangedSubview(signUpGoogleButton)
        
        signUpContainerView.addSubview(showSignInSceenStackView)
        showSignInSceenStackView.addArrangedSubview(haveAccountLabel)
        showSignInSceenStackView.addArrangedSubview(showSignUpSceenButton)

        view.updateConstraintsIfNeeded()
    }
    
    override func updateViewConstraints() {
        logoContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.20)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(logoContainerView.snp.centerX)
            make.centerY.equalTo(logoContainerView.snp.centerY)
            make.size.equalTo(logoContainerView).multipliedBy(0.6)
        }
        
        signUpContainerView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(20)
        }
        
        createAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpContainerView.snp.top).offset(30)
            make.left.equalTo(signUpContainerView.snp.left).offset(55)
            make.right.equalTo(signUpContainerView.snp.right).offset(-20)
        }
        
        getStartedLabel.snp.makeConstraints { make in
            make.top.equalTo(createAccountLabel.snp.bottom).offset(10)
            make.left.right.equalTo(createAccountLabel)
        }
        
        fullNameTextField.snp.makeConstraints { make in
            make.top.equalTo(getStartedLabel.snp.top).offset(60)
            make.left.equalTo(signUpContainerView.snp.left).offset(40)
            make.right.equalTo(signUpContainerView.snp.right).offset(-40)
            make.height.equalTo(55)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(fullNameTextField.snp.bottom).offset(13)
            make.left.right.equalTo(fullNameTextField)
            make.size.equalTo(fullNameTextField)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.left.right.equalTo(fullNameTextField)
            make.size.equalTo(emailTextField)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.left.right.equalTo(fullNameTextField)
            make.size.equalTo(passwordTextField)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(25)
            make.left.right.equalTo(fullNameTextField)
            make.size.equalTo(repeatPasswordTextField)
        }
        
        signUpSocialMediaTextLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(15)
            make.centerX.equalTo(signUpButton.snp.centerX)
        }
        
        socialMediaButtonsStackView.snp.makeConstraints { make in
            make.top.equalTo(signUpSocialMediaTextLabel.snp.bottom).offset(10)
            make.left.equalTo(signUpButton.snp.left)
            make.right.equalTo(signUpButton.snp.right)
        }
        
        showSignInSceenStackView.snp.makeConstraints { make in
            make.top.equalTo(socialMediaButtonsStackView.snp.bottom).offset(15)
            make.centerX.equalTo(socialMediaButtonsStackView.snp.centerX)
        }
        
        super.updateViewConstraints()
    }
}
