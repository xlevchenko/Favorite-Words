//
//  HomeTabRoute.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 9/1/23.
//

import UIKit

protocol HomeTabRoute {
    func makeHomeTab() -> UIViewController
}

extension HomeTabRoute where Self: Router {
    func makeHomeTab() -> UIViewController {
        // No transitions since these are managed by the TabBarController
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewModel = HomeViewModel(router: router)
        let viewControlle = HomeViewController(viewModel: viewModel)
        router.root = viewControlle

        let navigation = UINavigationController(rootViewController: viewControlle)
        navigation.tabBarItem = TabBar.home.item
        return navigation
    }
}

extension DefaultRouter: HomeTabRoute {}
