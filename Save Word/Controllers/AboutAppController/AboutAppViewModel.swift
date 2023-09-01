//
//  AboutAppViewModel.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/28/23.
//

import UIKit

final class AboutAppViewModel {
    typealias Routes = AboutAppRoute & WelcomeRoute
    
    private var router: Routes
    
    init(router: Routes) {
        self.router = router
    }
    
    func startButtonTapped() {
        router.openWelcomeScreen()
    }
}
