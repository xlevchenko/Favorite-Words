//
//  DashboardView.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 7/13/23.
//

import UIKit

class DashboardView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        
        let shadowColor = UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1.0)
        
        // Create the view
        backgroundColor = .white
        
        // Apply shadow properties
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = 0.38
        layer.shadowRadius = 10.0
        layer.shadowOffset = CGSize(width: 0, height: 0)
        //layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
