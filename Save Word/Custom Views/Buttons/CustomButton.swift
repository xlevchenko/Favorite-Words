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
        configuration()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configuration()
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        configuration()
    }
    
    func configuration() {
        titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        setTitleColor(.black, for: .normal)
        backgroundColor = UIColor(red: 1.00, green: 0.79, blue: 0.24, alpha: 1.00)
        layer.cornerRadius = 12
    }
    
}
