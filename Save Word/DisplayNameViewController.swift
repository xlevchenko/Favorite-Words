//
//  DisplayNameViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 12/16/22.
//

import UIKit

class DisplayNameViewController: UIViewController {
    
    let illustrationContainerView = UIView()
    
    let illustrationImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "backgroundName"))
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var enterNameContainerView = UIView()
    
    var getStartedLabel: TitleLabel = {
        let label = TitleLabel("Get started!", fontSize: 25)
        label.font = .systemFont(ofSize: 25, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
    let enterNameLabel: SecondaryLabel = {
        let label = SecondaryLabel("Enter your display name to start\nusing the app 😊.", fontSize: 17)
        return label
    }()
    
    var nameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.setLeftView(image: UIImage(systemName: "person.crop.square")!)
        textField.placeholder = "Enter name"
        return textField
    }()
    
    var doneButton: CustomButton = {
        let button = CustomButton(title: "Done")
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(illustrationContainerView)
        illustrationContainerView.addSubview(illustrationImageView)
        illustrationImageView.addSubview(enterNameContainerView)
        
        enterNameContainerView.addSubview(getStartedLabel)
        enterNameContainerView.addSubview(enterNameLabel)
        enterNameContainerView.addSubview(nameTextField)
        enterNameContainerView.addSubview(doneButton)
        
        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        
        illustrationContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        illustrationImageView.snp.makeConstraints { make in
            make.top.equalTo(illustrationContainerView.snp.top)
            make.left.equalTo(illustrationContainerView.snp.left)
            make.right.equalTo(illustrationContainerView.snp.right)
            make.bottom.equalTo(illustrationContainerView.snp.bottom)
        }
        
        enterNameContainerView.snp.makeConstraints { make in
            make.top.equalTo(illustrationImageView.snp.centerY).offset(80)
            make.left.equalTo(illustrationImageView.snp.left)
            make.right.equalTo(illustrationImageView.snp.right)
            make.bottom.equalTo(illustrationImageView.snp.bottom)
        }
        
        getStartedLabel.snp.makeConstraints { make in
            make.top.equalTo(enterNameContainerView.snp.top).offset(20)
            make.left.equalTo(enterNameContainerView.snp.left).offset(50)
        }
        
        enterNameLabel.snp.makeConstraints { make in
            make.top.equalTo(getStartedLabel.snp.top).offset(30)
            make.left.equalTo(enterNameContainerView.snp.left).offset(50)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(enterNameLabel.snp.bottom).offset(20)
            make.left.equalTo(enterNameContainerView.snp.left).offset(40)
            make.right.equalTo(enterNameContainerView.snp.right).offset(-40)
            make.height.equalTo(53)
        }
        
        doneButton.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(15)
            make.centerX.equalTo(nameTextField.snp.centerX)
            make.size.equalTo(nameTextField)
        }
        
        super.updateViewConstraints()
    }
}
