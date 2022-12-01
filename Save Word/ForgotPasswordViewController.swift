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
    let forgotPassordImageView = UIImageView(image: UIImage(named: "forgotPassword"))
    
    var forgotPassLabel: TitleLabel = {
        let label = TitleLabel("ForgotPassword", fontSize: 21)
        label.textColor = .black
        return label
    }()
    
    let detaileForgotPassLabel = SecondaryLabel("Enter your email address to\n retrieve your password", fontSize: 16)
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "envelope")!)
        textField.placeholder = "E-mail"
        return textField
    }()
    
    var resetPassButton = CustomButton(title: "RESET PASSWORD")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(forgotPassordImageView)
        view.addSubview(forgotPassLabel)
        view.addSubview(detaileForgotPassLabel)
        view.addSubview(emailTextField)
        view.addSubview(resetPassButton)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        topImageContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        forgotPassordImageView.snp.makeConstraints { make in
            make.centerX.equalTo(topImageContainerView.snp.centerX)
            make.centerY.equalTo(topImageContainerView.snp.centerY).offset(50)
            make.size.equalTo(CGSize(width: 303, height: 389)).multipliedBy(0.6)
        }
        
        forgotPassLabel.snp.makeConstraints { make in
            make.top.equalTo(topImageContainerView.snp.bottom).offset(70)
            make.centerX.equalToSuperview()
        }
        
        detaileForgotPassLabel.snp.makeConstraints { make in
            make.top.equalTo(forgotPassLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(detaileForgotPassLabel.snp.bottom).offset(30)
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
