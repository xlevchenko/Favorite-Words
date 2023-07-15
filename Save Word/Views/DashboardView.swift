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
        label.text = "100%"
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
        
        super.updateConstraints()
    }
}
