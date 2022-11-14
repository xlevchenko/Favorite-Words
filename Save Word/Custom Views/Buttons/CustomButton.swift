//
//  CustomButton.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/10/22.
//

import UIKit

class CustomButton: UIButton {
    
    let gradLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    func commonInit() {
        layer.insertSublayer(gradLayer, at: 0)
    }
    public func setGradientColor(colors: [CGColor], cornerRadius: CGFloat?) {
        gradLayer.colors = colors
        gradLayer.locations = [0.0, 1.0]
        gradLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        if let cornerRadius = cornerRadius {
            gradLayer.cornerRadius = cornerRadius
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradLayer.frame = bounds
    }
}
