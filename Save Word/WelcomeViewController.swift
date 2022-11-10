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
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private var detaileLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in with your data that you entered during Your registration."
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private var signUpButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Sing Up", for: .normal)
        button.setGradientColor(
            colors: [UIColor(red: 0.31, green: 0.70, blue: 0.88, alpha: 1.00).cgColor,
                     UIColor(red: 0.15, green: 0.48, blue: 0.75, alpha: 1.00).cgColor],
            cornerRadius: 15)
        return button
    }()
    
    private var singInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sing In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1.5
        button.layer.borderColor = CGColor(red: 0.24, green: 0.60, blue: 0.82, alpha: 1.00)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(welcomeImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(detaileLabel)
        view.addSubview(signUpButton)
        view.addSubview(singInButton)
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
            
            singInButton.snp.makeConstraints { make in
                make.top.equalTo(signUpButton.snp.bottom).offset(15)
                make.centerX.equalTo(signUpButton.snp.centerX)
                make.size.equalTo(signUpButton)
            }
        super.updateViewConstraints()
    }
}
