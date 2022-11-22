//
//  BodyLabel.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/21/22.
//

import UIKit

class BodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ text: String, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        self.text = text
    }
    
    convenience init(_ text: String, fontSize: CGFloat, color: UIColor) {
        self.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        self.text = text
        self.textColor = color
    }
    
    private func configure() {
        font = .systemFont(ofSize: 15, weight: .regular)
        textColor = .white
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
}
