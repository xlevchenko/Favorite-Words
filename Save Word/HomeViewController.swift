//
//  ViewController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 9/3/22.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let profileStatusView = ProfileStatusView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(profileStatusView)
        view.setNeedsUpdateConstraints()
    }
    
    
    override func updateViewConstraints() {
        profileStatusView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view.snp.left).offset(20)
            make.height.equalTo(63)
            make.width.equalTo(222)
        }
        
        
        
        super.updateViewConstraints()
    }
}

