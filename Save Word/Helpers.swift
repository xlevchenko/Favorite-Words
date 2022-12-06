//
//  Helpers.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/13/22.
//

import UIKit

extension UITextField {
  func setLeftView(image: UIImage) {
    let iconView = UIImageView(frame: CGRect(x: 13, y: 13, width: 19, height: 19)) // set your Own size
      iconView.contentMode = .scaleAspectFit
    iconView.image = image
    let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
      self.tintColor = .secondaryLabel //UIColor(red: 0.21, green: 0.21, blue: 0.21, alpha: 1.00)
  }
}

extension UIButton {
    convenience init(image: UIImage) {
        self.init(frame: .zero)
        self.setImage(image, for: .normal)
    }
    
    convenience init(title: String, font: UIFont, color: UIColor) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(color, for: .normal)
    }
}

extension UIView {
    convenience init(cornerRadius: CGFloat, backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
    }
}


extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: Distribution) {
        self.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }
}
