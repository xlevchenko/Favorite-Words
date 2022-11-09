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
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        [self.welcomeImageView,
            self.welcomeLabel,
            self.detaileLabel,
            self.signUpButton,
            self.singInButton].forEach { stack.addArrangedSubview($0) }
        return stack
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
    
    let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneX || DeviceTypes.isiPhoneXsMaxAndXr ? 170 : 80
    

    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {

            welcomeImageView.snp.makeConstraints { make in
                if UIDevice().userInterfaceIdiom == .phone {
                    switch UIScreen.main.bounds.size.height {
                    case 667:
                        print("iPhone SE (3rd & 2nd Gen), iPhone 8, iPhone 7, iPhone 6S")
                        make.top.equalTo(view.snp.top).offset(60)
                    case 736:
                        print("iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus")
                        make.top.equalTo(view.snp.top).offset(80)
                    case 812:
                        print("iPhone 11 Pro, iPhone XS, iPhone X, iPhone 13 mini, iPhone 12 mini")
                        make.top.equalTo(view.snp.top).offset(80)
                    case 844:
                        print("iPhone 14, iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12")
                        make.top.equalTo(view.snp.top).offset(170)
                    case 852:
                        print("iPhone 14 Pro")
                        make.top.equalTo(view.snp.top).offset(170)
                    case 896:
                        print("iPhone 11 Pro Max, iPhone XS Max, iPhone 11, iPhone XR")
                        make.top.equalTo(view.snp.top).offset(170)
                    case 932, 926:
                        print("iPhone 14 Pro Max, iPhone 14 Plus, iPhone 13 Pro Max, iPhone 12 Pro Max")
                        make.top.equalTo(view.snp.top).offset(170)
                    default:
                        print("Unknown")
                    }
                }
                //make.top.equalTo(view.snp.top).offset(80)
                make.left.equalTo(view.snp.left).offset(20)
                make.right.equalTo(view.snp.right).offset(-20)
            }
            
            welcomeLabel.snp.makeConstraints { make in
                make.top.equalTo(welcomeImageView.snp.bottom).offset(30)
                make.left.equalTo(view.snp.left).offset(30)
                make.right.equalTo(view.snp.right).offset(-20)
            }
            
            detaileLabel.snp.makeConstraints { make in
                make.top.equalTo(welcomeLabel.snp.bottom).offset(10)
                make.left.equalTo(view.snp.left).offset(30)
                make.right.equalTo(view.snp.right).offset(-30.0)
            }
            
            
            signUpButton.snp.makeConstraints { make in
                make.top.equalTo(detaileLabel.snp.bottom).offset(20)
                make.centerX.equalTo(view.snp.centerX)
                make.size.equalTo(CGSize(width: 222, height: 42))
            }
            
            singInButton.snp.makeConstraints { make in
                make.top.equalTo(signUpButton.snp.bottom).offset(10)
                make.centerX.equalTo(signUpButton.snp.centerX)
                make.size.equalTo(signUpButton)
            }
            
           
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
}
