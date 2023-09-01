//
//  ForgotPasswordRoute.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/30/23.
//

import UIKit

protocol ForgotPasswordRoute {
    func openForgotPasswordScreen()
}

extension ForgotPasswordRoute where Self: Router {
    
    func openForgotPasswordScreen(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewModel = ForgotPasswordViewModel(router: router)
        let viewController = ForgotPasswordViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.backItem?.title = "Some"
        router.root = viewController
        
        route(to: navigationController, as: transition)
    }
    
    func openForgotPasswordScreen() {
        openForgotPasswordScreen(with: ModalTransition(isAnimated: true, modalPresentationStyle: .overFullScreen))
    }
}

extension DefaultRouter: ForgotPasswordRoute { }
