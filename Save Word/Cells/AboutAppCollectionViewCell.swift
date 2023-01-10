//
//  AboutAppCollectionViewCell.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 1/8/23.
//

import UIKit
import SnapKit

class AboutAppCollectionViewCell: UICollectionViewCell {
    
    var aboutAppPage: AboutAppPage? {
        didSet {
            guard let page = aboutAppPage else { return }
            
            topImage.image = UIImage(named: page.imageName)
            headerTextLabel.text = page.headerText
            discriptionText.text = page.bodyText
        }
    }
    
    let topImageContainerView = UIView()
    
    private let topImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let headerTextLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let discriptionText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(topImage)
        addSubview(headerTextLabel)
        addSubview(discriptionText)
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        topImageContainerView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.height.equalTo(snp.height).multipliedBy(0.5)
        }
        
        topImage.snp.makeConstraints { make in
            make.centerX.equalTo(topImageContainerView.snp.centerX)
            make.centerY.equalTo(topImageContainerView.snp.centerY)
            make.height.equalTo(topImageContainerView.snp.height).multipliedBy(0.6)
        }
        
        headerTextLabel.snp.makeConstraints { make in
            make.top.equalTo(topImageContainerView.snp.bottom)
            make.left.equalTo(snp.left).offset(24)
            make.right.equalTo(snp.right).offset(-24)
        }
        
        discriptionText.snp.makeConstraints { make in
            make.top.equalTo(headerTextLabel.snp.bottom)
            make.left.equalTo(snp.left).offset(24)
            make.right.equalTo(snp.right).offset(-24)
            make.bottom.equalTo(snp.bottom).offset(0)
        }
        super.updateConstraints()
    }
}
