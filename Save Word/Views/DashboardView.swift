//
//  DashboardView.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 7/13/23.
//

import UIKit
import ALProgressView
import SnapKit

class DashboardView: UIView {
    
    private lazy var progressRing = ALProgressRing()
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.text = "83%"
        return label
    }()
    
    let dashboardLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .black)
        label.text = "Dashboard:"
        return label
    }()
    
    let setOvalImageView = UIImageView(image: UIImage(named: "GreenOval"))
    let wordsOvalImageView = UIImageView(image: UIImage(named: "PurpureOval"))
    let learnedOvalImageView = UIImageView(image: UIImage(named: "YellowOval"))
    
    let titleSetsListsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Sets"
        return label
    }()
    
    let titleWordsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Words"
        return label
    }()
    
    let titleLearnedWordsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Learned"
        return label
    }()
    
    let setsListsCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "53"
        return label
    }()
     
    let allWordsCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "124"
        return label
    }()
    
    let learnedWordsCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "32"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        congigure()
        setupProgressRing()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(progressRing)
        addSubview(progressLabel)
        addSubview(dashboardLabel)
        addSubview(setOvalImageView)
        addSubview(wordsOvalImageView)
        addSubview(learnedOvalImageView)
        addSubview(titleSetsListsLabel)
        addSubview(titleWordsLabel)
        addSubview(titleLearnedWordsLabel)
        addSubview(setsListsCountLabel)
        addSubview(allWordsCountLabel)
        addSubview(learnedWordsCountLabel)
    }
    
    func congigure() {
        layer.cornerRadius = 20
        backgroundColor = .white
        
        // Apply shadow properties
        let shadowColor = UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1.0)
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = 0.38
        layer.shadowRadius = 10.0
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.masksToBounds = false
    }
    
    func setupProgressRing() {
        progressRing.setProgress(0.8, animated: true)
        progressRing.startColor = UIColor(red: 1.00, green: 0.87, blue: 0.00, alpha: 1.00)
        progressRing.endColor = UIColor(red: 0.98, green: 0.69, blue: 0.20, alpha: 1.00)
        progressRing.lineWidth = 15
    }
    
    override func updateConstraints() {
        progressRing.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalToSuperview().offset(30)
            make.height.equalTo(110)
            make.width.equalTo(110)
        }
        
        progressLabel.snp.makeConstraints { make in
                make.centerX.equalTo(progressRing.snp.centerX)
                make.centerY.equalTo(progressRing.snp.centerY)
            }
        
        dashboardLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.left.equalTo(progressRing.snp.right).offset(35)
        }
        
        setOvalImageView.snp.makeConstraints { make in
            make.top.equalTo(dashboardLabel.snp.bottom).offset(10)
            make.left.equalTo(dashboardLabel.snp.left)
        }
        
        
        wordsOvalImageView.snp.makeConstraints { make in
            make.top.equalTo(setOvalImageView.snp.bottom).offset(10)
            make.left.equalTo(dashboardLabel.snp.left)
        }
        
        learnedOvalImageView.snp.makeConstraints { make in
            make.top.equalTo(wordsOvalImageView.snp.bottom).offset(10)
            make.left.equalTo(dashboardLabel.snp.left)
        }
        
        titleSetsListsLabel.snp.makeConstraints { make in
            make.left.equalTo(setOvalImageView.snp.right).offset(8)
            make.centerY.equalTo(setOvalImageView.snp.centerY)
        }
        
        titleWordsLabel.snp.makeConstraints { make in
            make.left.equalTo(wordsOvalImageView.snp.right).offset(8)
            make.centerY.equalTo(wordsOvalImageView.snp.centerY)
        }
        
        titleLearnedWordsLabel.snp.makeConstraints { make in
            make.left.equalTo(learnedOvalImageView.snp.right).offset(8)
            make.centerY.equalTo(learnedOvalImageView.snp.centerY)
        }
        
        setsListsCountLabel.snp.makeConstraints { make in
            make.top.equalTo(titleSetsListsLabel.snp.top)
            make.left.equalTo(dashboardLabel.snp.right).offset(-15)
        }
        
        allWordsCountLabel.snp.makeConstraints { make in
            make.top.equalTo(titleWordsLabel.snp.top)
            make.left.equalTo(setsListsCountLabel.snp.left)
        }
        
        learnedWordsCountLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLearnedWordsLabel.snp.top)
            make.left.equalTo(setsListsCountLabel.snp.left)
        }
        
        super.updateConstraints()
    }
}
