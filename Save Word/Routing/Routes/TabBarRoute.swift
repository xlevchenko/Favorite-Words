//
//  TabBarRoute.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 9/1/23.
//

import UIKit

protocol TabBarRoute {
    func openTabBarController()
}

extension TabBarRoute where Self: Router {
    func openTabBarController() {
        let router = DefaultRouter(rootTransition: ModalTransition())
        let viewController = TabBarController()

        let navigationController = UINavigationController(rootViewController: viewController)
        router.root = viewController
        
        route(to: navigationController, as: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: TabBarRoute { }
