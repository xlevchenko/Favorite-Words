//
//  WelcomeViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/7/22.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    var didSetupConstraints = false
    
    private var welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcome")
        return imageView
    }()
    
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private var detaileLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in with your data that you entered during Your registration."
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private var signUpButton: UIButton = {
       let button = UIButton()
        button.setTitle("Sing Up", for: .normal)
        button.backgroundColor = UIColor(red: 0.24, green: 0.60, blue: 0.82, alpha: 1.00)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private var singInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sing In", for: .normal)
        button.setTitleColor(.black, for: .normal) //= UIColor(red: 0.24, green: 0.60, blue: 0.82, alpha: 1.00)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 0.24, green: 0.60, blue: 0.82, alpha: 1.00)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(welcomeImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(detaileLabel)
        view.addSubview(signUpButton)
        view.addSubview(singInButton)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {
            
            welcomeImageView.snp.makeConstraints { make in
                make.top.equalTo(view.snp.top).offset(80.0)
                make.left.equalTo(view.snp.left).offset(20.0)
                make.right.equalTo(view.snp.right).offset(-20.0)
            }
            
            welcomeLabel.snp.makeConstraints { make in
                make.top.equalTo(welcomeImageView.snp.bottom).offset(50)
                make.left.equalTo(view.snp.left).offset(30)
            }
            
            detaileLabel.snp.makeConstraints { make in
                make.top.equalTo(welcomeLabel.snp.bottom).offset(20)
                make.left.equalTo(view.snp.left).offset(30)
                make.right.equalTo(view.snp.right).offset(-30.0)
            }
            
            signUpButton.snp.makeConstraints { make in
                make.top.equalTo(detaileLabel.snp.bottom).offset(50)
                make.size.equalTo(CGSize(width: 222, height: 42))
                make.centerX.equalTo(view.snp.centerX)
            }
            
            singInButton.snp.makeConstraints { make in
                make.top.equalTo(signUpButton.snp.bottom).offset(10)
                make.size.equalTo(CGSize(width: 222, height: 42))
                make.centerX.equalTo(view.snp.centerX)
            }
        }
        super.updateViewConstraints()
    }
    
}
