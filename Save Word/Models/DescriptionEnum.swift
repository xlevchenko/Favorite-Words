//
//  DescriptionEnum.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/25/23.
//

import UIKit

enum PageApp: Int, CaseIterable {
    case initPage = 0
    case nextPage
    case lastPage
    case app
    
    func nextPage() -> PageApp {
        switch self {
        case .initPage:
            return .nextPage
        case .nextPage:
            return .lastPage
        case .lastPage:
            return .app
        case .app:
            return .app
        }
    }
    
    func prevPage() -> PageApp {
        switch self {
        case .initPage:
            return .app
            
        case .nextPage:
            return .initPage
            
        case .lastPage:
            return .nextPage
            
        case .app:
            return .lastPage
        }
    }
}
