//
//  ForgotPasswordViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 12/1/22.
//

import UIKit
import SnapKit

class ForgotPasswordViewController: UIViewController {
    
    let illustrationContainerView = UIView()
    let illustrationImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "forgotPassword"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let bottonContainerView = UIView()
    
    var passwordLabel: TitleLabel = {
        let label = TitleLabel("Forgot your password?", fontSize: 21)
        label.textColor = .black
        return label
    }()
    
    let detailePasswordLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.text = "Enter your email address to\n retrieve your password"
        label.textAlignment = .center
        return label
    }()
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "envelope.fill")!)
        textField.placeholder = "E-mail"
        return textField
    }()
    
    var resetPasswordButton: CustomButton = {
        let button = CustomButton(title: "RESET PASSWORD")
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(illustrationContainerView)
        illustrationContainerView.addSubview(illustrationImageView)
        
        view.addSubview(bottonContainerView)
        bottonContainerView.addSubview(passwordLabel)
        bottonContainerView.addSubview(detailePasswordLabel)
        bottonContainerView.addSubview(emailTextField)
        bottonContainerView.addSubview(resetPasswordButton)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        illustrationContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        illustrationImageView.snp.makeConstraints { make in
            make.center.equalTo(illustrationContainerView.snp.center)
            make.size.equalTo(illustrationContainerView).multipliedBy(0.9)
        }
        
        bottonContainerView.snp.makeConstraints { make in
            make.top.equalTo(illustrationContainerView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(bottonContainerView.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        
        detailePasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(detailePasswordLabel.snp.bottom).offset(20)
            make.left.equalTo(bottonContainerView.snp.left).offset(40)
            make.right.equalTo(bottonContainerView.snp.right).offset(-40)
            make.height.equalTo(53)
        }
        
        resetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.centerX.equalTo(emailTextField.snp.centerX)
            make.size.equalTo(emailTextField)
        }
        
        super.updateViewConstraints()
    }  
}
