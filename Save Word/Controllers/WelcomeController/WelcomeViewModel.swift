//
//  WelcomeViewModel.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import Foundation


final class WelcomeViewModel {
    typealias Routes =  SignInRoute & SignUpRoute
    
    private var router: Routes
    
    init(router: Routes) {
        self.router = router
    }
    
    func openSignUpScreen() {
        router.openSignUpScreen()
    }
    
    func openSignInScreen() {
        router.openSignInScreen()
    }
}
