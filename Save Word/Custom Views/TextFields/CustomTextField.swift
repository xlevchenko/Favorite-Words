//
//  CustomTextField.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/13/22.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 15
        leftViewMode = .always
        backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        layer.borderColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1.00).cgColor
        layer.borderWidth = 0.5
        font = .systemFont(ofSize: 14, weight: .regular)
    }
}
