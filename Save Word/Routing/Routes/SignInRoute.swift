//
//  SignInRoute.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/30/23.
//

import UIKit

protocol SignInRoute {
    func openSignInScreen()
}

extension SignInRoute where Self: Router {
    
    func openopenSignInScreen(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewModel = SignInViewModel(router: router)
        let viewController = SignInViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        router.root = viewController
        
        route(to: navigationController, as: transition)
    }
    
    func openSignInScreen() {
        openopenSignInScreen(with: ModalTransition(isAnimated: true, modalPresentationStyle: .fullScreen))
    }
}

extension DefaultRouter: SignInRoute { }
