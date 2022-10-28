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

        viewControllers = [createHomeNavController()]
    }
    

    func createHomeNavController() -> UINavigationController {
        let homeVC = ViewController()
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }

}
