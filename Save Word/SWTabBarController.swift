//
//  SWTabBarController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 10/28/22.
//

import UIKit

class SWTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.3681200445, green: 0.1824620366, blue: 0.9034458399, alpha: 1)
        //UITabBar.appearance().
        viewControllers = [
            createHomeNavController(),
            createAddListWordNavController(),
            createLearnNavController(),
            createProfileNavController(),
        ]
    }
    

    func createHomeNavController() -> UINavigationController {
        let homeVC = HomeViewController()
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createAddListWordNavController() -> UINavigationController {
        let addListWordVC = UIViewController()
        addListWordVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "search"), tag: 1)
        addListWordVC.view.backgroundColor = .white
        return UINavigationController(rootViewController: addListWordVC)
    }
    
    func createLearnNavController() -> UINavigationController {
        let learnVC = UIViewController()
        learnVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "plus"), tag: 2)
        learnVC.view.backgroundColor = .white
        return UINavigationController(rootViewController: learnVC)
    }
    
    func createProfileNavController() -> UINavigationController {
        let profileVC = UIViewController()
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile"), tag: 3)
        profileVC.view.backgroundColor = .white
        return UINavigationController(rootViewController: profileVC)
    }

}
