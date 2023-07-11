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
        
        UITabBar.appearance().tintColor =  UIColor(red: 0.24, green: 0.60, blue: 0.82, alpha: 1.00)

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
