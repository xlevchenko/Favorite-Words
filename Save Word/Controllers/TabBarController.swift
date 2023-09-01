//
//  SWTabBarController.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 10/28/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    let mainRouter = DefaultRouter(rootTransition: EmptyTransition())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.3681200445, green: 0.1824620366, blue: 0.9034458399, alpha: 1)

        viewControllers = [
            mainRouter.makeHomeTab(),
            createAddListWordNavController(),
            createLearnNavController(),
            createProfileNavController(),
        ]
    }
    
    func createAddListWordNavController() -> UINavigationController {
        let addListWordVC = UIViewController()
        addListWordVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "search"), tag: 1)
        return UINavigationController(rootViewController: addListWordVC)
    }
    
    func createLearnNavController() -> UINavigationController {
        let learnVC = UIViewController()
        learnVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "plus"), tag: 2)
        return UINavigationController(rootViewController: learnVC)
    }
    
    func createProfileNavController() -> UINavigationController {
        let profileVC = UIViewController()
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile"), tag: 3)
        return UINavigationController(rootViewController: profileVC)
    }
}
