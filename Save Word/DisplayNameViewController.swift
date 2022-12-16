//
//  DisplayNameViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 12/16/22.
//

import UIKit

class DisplayNameViewController: UIViewController {
    
    let backgraundImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "backgroundName"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let displayNameContainerView = UIView()
    
    var getStartedTitleLabel: TitleLabel = {
        let label = TitleLabel("Get started!", fontSize: 25)
        label.font = .systemFont(ofSize: 25, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
    let secondaryDisplayNameLabel: SecondaryLabel = {
        let label = SecondaryLabel("Enter your display name to start\nusing the app 😊.", fontSize: 17)
        return label
    }()
    
    var displayNameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "person.crop.square")!)
        textField.placeholder = "Enter name"
        return textField
    }()
    
    var addDisplayNameButton: CustomButton = {
        let button = CustomButton(title: "Done")
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgraundImageView)
        
        backgraundImageView.addSubview(displayNameContainerView)
        displayNameContainerView.addSubview(getStartedTitleLabel)
        displayNameContainerView.addSubview(secondaryDisplayNameLabel)
        displayNameContainerView.addSubview(displayNameTextField)
        displayNameContainerView.addSubview(addDisplayNameButton)
        
        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        
        backgraundImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        displayNameContainerView.snp.makeConstraints { make in
            make.top.equalTo(backgraundImageView.snp.centerY).offset(80)
            make.left.equalTo(backgraundImageView.snp.left)
            make.right.equalTo(backgraundImageView.snp.right)
            make.bottom.equalTo(backgraundImageView.snp.bottom)
        }
        
        getStartedTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(displayNameContainerView.snp.top).offset(20)
            make.left.equalTo(displayNameContainerView.snp.left).offset(50)
        }
        
        secondaryDisplayNameLabel.snp.makeConstraints { make in
            make.top.equalTo(getStartedTitleLabel.snp.top).offset(30)
            make.left.equalTo(displayNameContainerView.snp.left).offset(50)
        }
        
        displayNameTextField.snp.makeConstraints { make in
            make.top.equalTo(secondaryDisplayNameLabel.snp.bottom).offset(20)
            make.left.equalTo(displayNameContainerView.snp.left).offset(40)
            make.right.equalTo(displayNameContainerView.snp.right).offset(-40)
            make.height.equalTo(53)
        }
        
        addDisplayNameButton.snp.makeConstraints { make in
            make.top.equalTo(displayNameTextField.snp.bottom).offset(15)
            make.centerX.equalTo(displayNameTextField.snp.centerX)
            make.size.equalTo(displayNameTextField)
        }
        
        super.updateViewConstraints()
    }
}
