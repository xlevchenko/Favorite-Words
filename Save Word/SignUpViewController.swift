
//  SlgnUpViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 12/5/22.
//
import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    let logoContainerView = UIView()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logoWhite"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let signUpContainerView = UIView(cornerRadius: 59, backgroundColor: .white)
    
    var signUpSceenLabel: TitleLabel = {
        let label = TitleLabel("Sign Up", fontSize: 30)
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textColor = .black
        return label
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
    
    let signUpButton = CustomButton(title: "Sign Up")
    
    let signUpSocialMediaTextLabel = SecondaryLabel("OR", fontSize: 10)
    let signUpFacebookButton = UIButton(image: UIImage(named: "Facebook 1")!)
    let signUpGoogleButton = UIButton(image: UIImage(named: "Google 1")!)
    
    lazy var socialMediaButtonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signUpFacebookButton, signUpGoogleButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let presentSignUpSceenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
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
    
    lazy var showSignInSceenStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [haveAccountLabel, showSignUpSceenButton])
        stackView.axis = .horizontal
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.43, green: 0.38, blue: 0.98, alpha: 1.00)
        
        view.addSubview(logoContainerView)
        logoContainerView.addSubview(logoImageView)
        
        view.addSubview(signUpContainerView)
        signUpContainerView.addSubview(signUpSceenLabel)
        signUpContainerView.addSubview(emailTextField)
        signUpContainerView.addSubview(passwordTextField)
        signUpContainerView.addSubview(repeatPasswordTextField)
        signUpContainerView.addSubview(signUpButton)
        signUpContainerView.addSubview(signUpSocialMediaTextLabel)
        signUpContainerView.addSubview(socialMediaButtonsStackView)
        signUpContainerView.addSubview(showSignInSceenStackView)
        
        view.updateConstraintsIfNeeded()
        
        signUpButton.addTarget(self, action: #selector(showSWTabBarScreen), for: .touchUpInside)
        showSignUpSceenButton.addTarget(self, action: #selector(showSignInScreen), for: .touchUpInside)
    }
    
    @objc func showSWTabBarScreen() {
        let destination = SWTabBarController()
        let navigationController = UINavigationController(rootViewController: destination)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
    
    @objc func showSignInScreen() {
        let signInViewController = SignInViewController()
        let navigationController = UINavigationController(rootViewController: signInViewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
    
    override func updateViewConstraints() {
        logoContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(logoContainerView.snp.centerX)
            make.centerY.equalTo(logoContainerView.snp.centerY).offset(25)
            make.size.equalTo(logoContainerView).multipliedBy(0.9)
        }
        
        signUpContainerView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(25)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(40)
        }
        
        signUpSceenLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpContainerView.snp.top).offset(30)
            make.centerX.equalTo(signUpContainerView.snp.centerX)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpSceenLabel.snp.bottom).offset(25)
            make.left.equalTo(signUpContainerView.snp.left).offset(40)
            make.right.equalTo(signUpContainerView.snp.right).offset(-40)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.left.right.equalTo(emailTextField)
            make.size.equalTo(emailTextField)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.left.right.equalTo(passwordTextField)
            make.size.equalTo(passwordTextField)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(25)
            make.left.right.equalTo(repeatPasswordTextField)
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
