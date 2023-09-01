//
//  ForgotPasswordViewModel.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/30/23.
//

import Foundation

final class ForgotPasswordViewModel {
    typealias Routes = SignInRoute
    
    private var router: Routes
    
    init(router: Routes) {
        self.router = router
    }
    
    func openForgotPasswordScreen() {
        router.openSignInScreen()
    }
}
