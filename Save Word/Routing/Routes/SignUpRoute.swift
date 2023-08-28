//
//  SignUpRoute.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import UIKit

protocol SignUpRoute {
    func openSignUpScreen()
}

extension SignUpRoute where Self: Router {
    func openSignUpScreen(with transition: Transition) {
        
        let router = DefaultRouter(rootTransition: transition)
        let viewModel = SignUpViewModel(router: router)
        let viewController = SignUpViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        router.root = viewController
        
        route(to: navigationController, as: transition)
    }
    
    func openSignUpScreen() {
        openSignUpScreen(with: ModalTransition(isAnimated: true, modalPresentationStyle: .fullScreen))
    }
}

extension DefaultRouter: SignUpRoute { }
