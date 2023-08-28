//
//  WelcomeViewModel.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import Foundation


final class WelcomeViewModel {
    typealias Routes = WelcomeRoute & AboutAppRoute & SignUpRoute
    
    private var router: Routes
    
    init(router: Routes) {
        self.router = router
    }
    
    func signUpButtonTapped() {
        print("some")
        router.openSignUpScreen()
    }
    
    func signInButtonTapped() {
        
    }
}
