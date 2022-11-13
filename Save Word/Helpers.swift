//
//  Helpers.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 11/13/22.
//

import UIKit

extension UITextField {
  func setLeftView(image: UIImage) {
    let iconView = UIImageView(frame: CGRect(x: 14, y: 14, width: 17, height: 17)) // set your Own size
      iconView.contentMode = .scaleAspectFit
    iconView.image = image
    let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
    self.tintColor = .lightGray
  }
}
