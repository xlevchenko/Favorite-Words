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
    
    let searchButton: UIButton  = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "SearchButton"), for: .normal)
        return button
    }()
    
    let dashboardView = DashboardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(profileStatusView)
        view.addSubview(searchButton)
        view.addSubview(dashboardView)
        view.setNeedsUpdateConstraints()
    }
    
    
    override func updateViewConstraints() {
        profileStatusView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view.snp.left).offset(20)
            make.height.equalTo(63)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(profileStatusView.snp.right).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
            make.centerY.equalTo(profileStatusView.snp.centerY)
        }
        
        dashboardView.snp.makeConstraints { make in
            make.top.equalTo(profileStatusView.snp.bottom).offset(28)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(146)
        }
        
        super.updateViewConstraints()
    }
}

