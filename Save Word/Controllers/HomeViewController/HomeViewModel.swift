//
//  HomeViewModel.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 9/1/23.
//


import Foundation

final class HomeViewModel {
    
    typealias Routes = WelcomeRoute
    private let router: Routes
    
    init(router: Routes) {
        self.router = router
    }
}
