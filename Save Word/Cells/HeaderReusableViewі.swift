//
//  HeaderReusableView.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 7/15/23.
//

import UIKit
import SnapKit

class HeaderReusableViewі: UICollectionReusableView {
    
    static let cellIdentifier = "HeaderReusableView"
    
    var someText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 29, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
    let allSetsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    
    func configure(with title: String, buttonTitle: String) {
        someText.text = title
        allSetsButton.setTitle(buttonTitle, for: .normal)
    }
    
    func setupSubviews() {
        addSubview(someText)
        addSubview(allSetsButton)
    }
    
    override func updateConstraints() {
        
        someText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(20)
        }
        
        allSetsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-15)
        }
        super.updateConstraints()
    }
}
