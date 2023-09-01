//
//  DescriptionEnum.swift
//  Save Word
//
//  Created by Olexsii Levchenko on 8/25/23.
//

import UIKit

enum PageApp: Int, CaseIterable {
    case initPage = 0
    case nextPage = 1
    case lastPage = 2
    
    func nextPage() -> PageApp {
        switch self {
        case .initPage:
            return .nextPage
        case .nextPage:
            return .lastPage
        case .lastPage:
            return .lastPage
        }
    }
}
