//
//  WelcomeViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/7/22.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    private let viewModel: WelcomeViewModel
    
    let topImageContainerView = UIView()
    let welcomeImageView = UIImageView(image: UIImage(named: "welcome"))
    let welcomeLabel = TitleLabel("Welcome!", fontSize: 36)
    let detaileLabel = BodyLabel("Log in with your data that you entered during Your registration.", fontSize: 18)
    let signUpButton = CustomButton(title: "Sign Up")
    let signInLabel = BodyLabel("Already have an account! ", fontSize: 15)
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(.systemYellow, for: .normal)
        return button
    }()

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        return stack
    }()
    
    var coordinator = MainFlowCoordinator()
    
    weak var delegete: MainFlowCoordinator?
    
    
    
    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        stackView.addArrangedSubview(signInButton)
        view.setNeedsUpdateConstraints()
        
        signUpButton.addTarget(self, action: #selector(singUpButtonTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
    }
    
    @objc func singUpButtonTapped() {
        viewModel.openSignUpScreen()
    }
    
    @objc func singInButtonTapped() {
        viewModel.openSignInScreen()
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
            make.left.equalTo(view.snp.left).offset(40)
            make.right.equalTo(view.snp.right).offset(-40)
            make.height.equalTo(50)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(12)
            make.centerX.equalTo(signUpButton)
        }
        super.updateViewConstraints()
    }
}
