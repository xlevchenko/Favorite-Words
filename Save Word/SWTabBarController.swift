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

        viewControllers = [
            createHomeNavController(),
            createAddListWordNavController(),
            createLearnNavController(),
            createProfileNavController(),
        ]
    }
    

    func createHomeNavController() -> UINavigationController {
        let homeVC = ViewController()
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createAddListWordNavController() -> UINavigationController {
        let addListWordVC = UIViewController()
        addListWordVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "plus"), tag: 1)
        addListWordVC.view.backgroundColor = .white
        return UINavigationController(rootViewController: addListWordVC)
    }
    
    func createLearnNavController() -> UINavigationController {
        let learnVC = UIViewController()
        learnVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gamecontroller"), tag: 2)
        learnVC.view.backgroundColor = .white
        return UINavigationController(rootViewController: learnVC)
    }
    
    func createProfileNavController() -> UINavigationController {
        let profileVC = UIViewController()
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), tag: 3)
        profileVC.view.backgroundColor = .white
        return UINavigationController(rootViewController: profileVC)
    }

}
