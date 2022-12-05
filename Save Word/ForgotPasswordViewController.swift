//
//  ForgotPasswordViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 12/1/22.
//

import UIKit
import SnapKit

class ForgotPasswordViewController: UIViewController {
    
    let topImageContainerView = UIView()
    let forgotPassImageView = UIImageView(image: UIImage(named: "forgotPassword"))
    let forgotPassContainerView = UIView()
    
    var forgotPassLabel: TitleLabel = {
        let label = TitleLabel("Forgot your password?", fontSize: 21)
        label.textColor = .black
        return label
    }()
    
    let detaileForgotPassLabel: SecondaryLabel = {
        let label = SecondaryLabel()
        label.text = "Enter your email address to\n retrieve your password"
        label.textAlignment = .center
        return label
    }()
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "envelope")!)
        textField.placeholder = "E-mail"
        return textField
    }()
    
    var resetPassButton: CustomButton = {
        let button = CustomButton(title: "RESET PASSWORD")
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(forgotPassImageView)
        
        view.addSubview(forgotPassContainerView)
        forgotPassContainerView.addSubview(forgotPassLabel)
        forgotPassContainerView.addSubview(detaileForgotPassLabel)
        forgotPassContainerView.addSubview(emailTextField)
        forgotPassContainerView.addSubview(resetPassButton)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        topImageContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        forgotPassImageView.snp.makeConstraints { make in
            make.center.equalTo(topImageContainerView.snp.center)
            make.size.equalTo(CGSize(width: 303, height: 389))
        }
        
        forgotPassContainerView.snp.makeConstraints { make in
            make.top.equalTo(topImageContainerView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom)
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        forgotPassLabel.snp.makeConstraints { make in
            make.top.equalTo(forgotPassContainerView).offset(90)
            make.centerX.equalToSuperview()
        }
        
        detaileForgotPassLabel.snp.makeConstraints { make in
            make.top.equalTo(forgotPassLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(detaileForgotPassLabel.snp.bottom).offset(20)
            make.size.equalTo(CGSize(width: 260, height: 50))
            make.centerX.equalToSuperview()
        }
        
        resetPassButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.centerX.equalTo(emailTextField.snp.centerX)
            make.size.equalTo(emailTextField)
        }
        super.updateViewConstraints()
    }  
}
