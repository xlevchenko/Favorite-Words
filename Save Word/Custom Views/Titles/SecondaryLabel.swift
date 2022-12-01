//
//  SecondaryTitle.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/21/22.
//

import UIKit

class SecondaryLabel: UILabel {

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

    private func configure() {
        textColor                   = .secondaryLabel
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.90
        lineBreakMode               = .byTruncatingTail
        numberOfLines               = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
