//
//  WelcomeViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/7/22.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    private var topImageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcome")
        return imageView
    }()
    
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.font = .systemFont(ofSize: 36, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private var detaileLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in with your data that you entered during Your registration."
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private var signUpButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 1.00, green: 0.79, blue: 0.24, alpha: 1.00)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private var signInLabel = {
        let label = UILabel()
        label.text = "Already have an account!"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private var singInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 1.00, green: 0.79, blue: 0.24, alpha: 1.00), for: .normal)
        return button
    }()
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.43, green: 0.38, blue: 0.98, alpha: 1.00)
        
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(welcomeImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(detaileLabel)
        view.addSubview(signUpButton)
        view.addSubview(stackView)
        stackView.addArrangedSubview(signInLabel)
        stackView.addArrangedSubview(singInButton)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        
        topImageContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        welcomeImageView.snp.makeConstraints { make in
            make.centerX.equalTo(topImageContainerView.snp.centerX)
            make.centerY.equalTo(topImageContainerView.snp.centerY).offset(50)
            make.size.equalTo(CGSize(width: 331, height: 344)).multipliedBy(0.6)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(topImageContainerView.snp.bottom).offset(65)
            make.left.right.equalToSuperview().offset(30)
        }
        
        detaileLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30.0)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(detaileLabel.snp.bottom).offset(25)
            make.centerX.equalTo(view.snp.centerX)
            make.size.equalTo(CGSize(width: 280, height: 50))
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(12)
            make.centerX.equalTo(view.snp.centerX)
            //make.size.equalTo(signUpButton)
        }
        super.updateViewConstraints()
    }
}
