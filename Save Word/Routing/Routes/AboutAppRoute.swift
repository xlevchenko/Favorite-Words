//
//  AboutAppRoute.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import UIKit

protocol AboutAppRoute {
    func openAboutAppScreen() -> UIViewController
}


extension AboutAppRoute where Self: Router {
    
    func openAboutAppScreen() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewModel = AboutAppViewModel(router: router)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let viewController = AboutAppViewController(viewModel: viewModel, layout: layout)
        let navigationController = UINavigationController(rootViewController: viewController)
        router.root = viewController
        
        
        return navigationController
    }
    
   
}

extension DefaultRouter: AboutAppRoute { }
