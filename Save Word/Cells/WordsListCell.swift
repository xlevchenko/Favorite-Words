//
//  WordsListCellCollectionViewCell.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 7/15/23.
//

import UIKit
import SnapKit
import ALProgressView

class WordsListCell: UICollectionViewCell {
    
    static let cellIdentifier = "WordsListCell"
    
    let termsCountContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1.00, green: 0.79, blue: 0.24, alpha: 1.00)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let termsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.text = "38 terms"
        return label
    }()
    
    let nameSetLabel: UILabel = {
        let label = UILabel()
        label.text = "English language names‎"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    let progressView: ALProgressBar = {
        let progress = ALProgressBar()
        progress.startColor = #colorLiteral(red: 0.6320898533, green: 0.303041935, blue: 0.9096155763, alpha: 1)
        progress.endColor = #colorLiteral(red: 0.3681200445, green: 0.1824620366, blue: 0.9034458399, alpha: 1)
        progress.setProgress(0.8, animated: true)
        return progress
    }()
    
    let completedLabel: UILabel = {
        let label = UILabel()
        label.text = "Completed"
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = UIColor(red: 0.57, green: 0.56, blue: 0.56, alpha: 1.00)
        return label
    }()
    
    let percentagesLabel: UILabel = {
        let label = UILabel()
        label.text = "81%"
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = UIColor(red: 0.57, green: 0.56, blue: 0.56, alpha: 1.00)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        congigure()
        setupSubviews()
        setNeedsUpdateConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(termsCountContainerView)
        termsCountContainerView.addSubview(termsLabel)
        addSubview(nameSetLabel)
        addSubview(progressView)
        addSubview(completedLabel)
        addSubview(percentagesLabel)
    }
    
    func congigure() {
        layer.cornerRadius = 20
        backgroundColor = .white
        
        // Apply shadow properties
        let shadowColor = UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1.0)
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = 0.22
        layer.shadowRadius = 10.0
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.masksToBounds = false
    }
    
    override func updateConstraints() {
        termsCountContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(20)
        }
        
        termsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(termsCountContainerView.snp.centerY)
            make.left.equalTo(termsCountContainerView.snp.left).inset(4)
            make.right.equalTo(termsCountContainerView.snp.right).inset(4)
        }
        
        nameSetLabel.snp.makeConstraints { make in
            make.top.equalTo(termsLabel.snp.bottom).offset(25)
            make.left.equalTo(termsLabel.snp.left)
            make.right.equalToSuperview().inset(15)
        }
        
        progressView.snp.makeConstraints { make in
            make.top.equalTo(nameSetLabel.snp.bottom).offset(20)
            make.left.equalTo(nameSetLabel.snp.left)
            make.right.equalTo(nameSetLabel.snp.right)
            make.height.equalTo(8)
        }
        
        completedLabel.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(5)
            make.left.equalTo(progressView.snp.left)
        }
        
        percentagesLabel.snp.makeConstraints { make in
            make.top.equalTo(completedLabel.snp.top)
            make.right.equalTo(progressView.snp.right)
        }
        
        super.updateConstraints()
    }
}
