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
    
    convenience init(image: UIImage, placeholder: String) {
        self.init(frame: .zero)
        self.setLeftView(image: image)
        self.placeholder = placeholder
        configure()
    }
    
    convenience init(image: UIImage, placeholder: String, isSecure: Bool) {
        self.init(frame: .zero)
        self.setLeftView(image: image)
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecure
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 12
        leftViewMode = .always
        backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 1.00, alpha: 1.00) //UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        //layer.borderColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1.00).cgColor
        //layer.borderWidth = 0.5
        font = .systemFont(ofSize: 14, weight: .regular)
    }
}
