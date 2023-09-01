//
//  SignUpViewModel.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

final class SignUpViewModel {
    typealias Routes = SignInRoute & SignUpRoute & TabBarRoute
    
    private var router: Routes
    
    init(router: Routes) {
        self.router = router
    }
    
    func openSignInScreen() {
        router.openSignInScreen()
    }
    
    func openHomeScreen() {
        router.openTabBarController()
    }
}
