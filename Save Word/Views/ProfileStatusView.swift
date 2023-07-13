//
//  ProfileStatusView.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 7/10/23.
//

import UIKit
import SnapKit

class ProfileStatusView: UIView {
    
    let nameProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "Olexsii Levchenko"
        label.font = UIFont(name: "SFProMedium", size: 15)
        label.textColor = .white
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Premium"
        label.font = UIFont(name: "SFProRegular", size: 13)
        label.textColor = .white
        return label
    }()

    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let newNotificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bell"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameProfileLabel)
        addSubview(statusLabel)
        addSubview(statusImageView)
        addSubview(newNotificationButton)
        //test1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setGradientBackground()
    }
    
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [#colorLiteral(red: 0.6320898533, green: 0.303041935, blue: 0.9096155763, alpha: 1).cgColor, #colorLiteral(red: 0.3681200445, green: 0.1824620366, blue: 0.9034458399, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.locations = [0,1]
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 20
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        nameProfileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.left.equalToSuperview().offset(20)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(nameProfileLabel.snp.bottom)
            make.left.equalToSuperview().offset(20)
        }
        
        statusImageView.snp.makeConstraints { make in
            make.centerY.equalTo(statusLabel.snp.centerY)
            make.left.equalTo(statusLabel.snp.right).offset(5)
        }
        
        newNotificationButton.snp.makeConstraints { make in
            make.left.equalTo(nameProfileLabel.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
        
        super.updateConstraints()
    }
}
