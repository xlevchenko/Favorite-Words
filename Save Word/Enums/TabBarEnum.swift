//
//  TabBarEnum.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/31/23.
//

import UIKit

enum TabBar {
    case home
    case search
    case game
    case profile
    
    var index: Int {
        switch self {
        case .home:
            return 0
        case .search:
            return 1
        case .game:
            return 3
        case .profile:
            return 4
        }
    }
    
    var item: UITabBarItem {
        switch self {
        case .home:
            return UITabBarItem(title: nil, image: UIImage(named: "home"), tag: index)
        case .search:
            return UITabBarItem(title: nil, image: UIImage(named: "search"), tag: index)
        case .game:
            return UITabBarItem(title: nil, image: UIImage(named: "plus"), tag: index)
        case .profile:
            return UITabBarItem(title: nil, image: UIImage(named: "profile"), tag: index)
        }
    }
}
