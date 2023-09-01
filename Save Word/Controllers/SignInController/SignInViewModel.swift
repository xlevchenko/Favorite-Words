//
//  SignInViewModel.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/30/23.
//

import Foundation

final class SignInViewModel {
    typealias Routes = SignInRoute & SignUpRoute & ForgotPasswordRoute & TabBarRoute
    
    private var router: Routes
    
    init(router: Routes) {
        self.router = router
    }
    
    func openSignUpScreen() {
        router.openSignUpScreen()
    }
    
    func openForgetPasswordScreen() {
        router.openForgotPasswordScreen()
    }
    
    func openHomeScreen() {
        router.openTabBarController()
    }
}
